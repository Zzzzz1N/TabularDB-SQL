# TabularDB-SQL: Question-Answering over Tabular Data with LLM



## 1. Overview

TabularDB-SQL is an experimental project leveraging LLM to enable Question-and-Answer functionality based on tabular data. The project comprises several phases, including Data Collection, Data Preprocessing, Prompt Engineering, Model Fine-Tuning, Model Inference, and Data Querying based on Tabular Databases. Through these processes, our goal is to enhance the LLM’s ability to perform Text-to-SQL tasks and implement an automated, database-based question-answering feature, allowing users to conduct complex database queries using natural language descriptions.



## 2. Environment Setup

We use *conda* to set up the environment.

```
cd TabularDB-SQL
conda create -n text2sql python=3.10 
conda activate text2sql
pip install -r requirements.txt

# conda env create -f environment.yml
```

The current project supports multiple base models. We use *CodeLlama-13b-Instruct-hf* as our base model. It can be downloaded from [HuggingFace](https://huggingface.co/codellama/CodeLlama-13b-Instruct-hf).

```
huggingface-cli download --resume-download codellama/CodeLlama-13b-Instruct-hf --local-dir your_model_dir --local-dir-use-symlinks False --resume-download

# git lfs install
# git clone git@hf.co:codellama/CodeLlama-13b-Instruct-hf
```



## 3. Data Preparation

### 3.1. Dataset

- **Spider**: 

  Spider is a large-scale complex and cross-domain semantic parsing and text-to-SQL dataset annotated by 11 Yale students. The goal of the Spider challenge is to develop natural language interfaces to cross-domain databases. It consists of 10,181 questions and 5,693 unique complex SQL queries on more than 200 databases with multiple tables covering 138 different domains. [Download Spider](https://yale-lily.github.io/spider)

- **DataBench**: 

  DataBench provide a corpus of 65 real world datasets, with 3,269,975 and 1615 columns in total, and 1300 questions to evaluate your models for the task of QA over Tabular Data. [Download DataBench](https://huggingface.co/datasets/cardiffnlp/databench)

### 3.2. Data Process

The following is an example of data processing for the Spider dataset.

In Spider dataset, the training and validation sets include 8659 and 1034 question-answer pairs covering 166 tabular databases. The test set includes 2147 questions covering 206 tabular databases.

Run the script command to get a dataset with table information and query pairs:

```
# Generate train and dev data based on spider dataset
sh scripts/train_dev_data_process.sh

# Generate test data based on spider dataset (with blank OUTPUT prompt)
sh scripts/test_data_process.sh
```

The format of each piece of data in the generated dataset:

```
{
  "db_id": "name_of_database",
  "instruction": "[INSTRUCTION_PROMPT]\n##Instruction: [Database Description]",
  "input": "###Input:[Input Query]\n###Response:",
  "output": "[SQL Statement]",
  "history": []
}
```

### 3.3. Prompt Engineering

Appropriate lead words allow LLMs to better understand downstream tasks. INSTRUCTION_PROMPT can be defined in `configs/config.py`.

```
INSTRUCTION_PROMPT = "I want you to act as a SQL terminal in front of an example database, you need only to return the sql command to me. Below is an instruction that describes a task, write a response that appropriately completes the request.\n ##Instruction:\n{}\n"
```

In addition, we have two different question representations under zeroshot scenario for Text-to-SQL.

- **Text Representation:** Text Representation Prompt represents schema and questions in natural language. It adds instructions to guide the LLMs at the beginning of the prompt.

```
'aan_1 contains tables such as Affiliation, Author, Author_list, Citation, Paper. (...) 
	Table Citation has columns such as paper_id, cited_paper_id. paper_id is the primary key.
	The cited_paper_id of Citation is the foreign key of paper_id of Paper.
	The paper_id of Citation is the foreign key of paper_id of Paper.
'
```

- **Code Representation:** Code Representation Prompt presents Text-to-SQL task in SQL syntax. Specifically,  it directly presents “CREAT TABLE” SQLs, and prompts LLM with natural language question in INPUT.

```
'CREATE TABLE "Citation" (
	"paper_id" int,        
	"cited_paper_id" int,        
	PRIMARY KEY ("paper_id"),        
	FOREIGN KEY ("cited_paper_id") REFERENCES "Paper"("paper_id"),        
	FOREIGN KEY ("paper_id") REFERENCES "Paper"("paper_id")    
);',
```

In the data processing step, text/code representation can be selected by argument `--code_representation`.



## 4. Supervised Finetuning

Run the training script to fine-tune LLM.

```
sh scripts/train_sft.sh
```

Detailed parameters are listed below:

```
dataset="spider_train"  # set in data/dataset_info.json
model_name_or_path="path_to_hf_model"
output_dir="path_to_checkpoint_output"

CUDA_VISIBLE_DEVICES=0 python train/sft_train.py \
    --model_name_or_path $model_name_or_path \
    --do_train \
    --dataset $dataset \
    --max_source_length 2048 \
    --max_target_length 512 \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --template llama2 \
    --lora_rank 64 \
    --lora_alpha 32 \
    --output_dir $output_dir \
    --overwrite_cache \
    --overwrite_output_dir \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 16 \
    --lr_scheduler_type cosine_with_restarts \
    --logging_steps 50 \
    --save_steps 2000 \
    --learning_rate 2e-4 \
    --num_train_epochs 8 \
    --plot_loss \
    --quantization_bit 4 \
    --bf16  >> ${train_log}
    
# the default param set could be run in a server with one RTX4090(24G) gpu
# because of limited gpu, set --quantization_bit to train by QLoRA
```

After training, if you need to convert `adapter_model.safetensors` to `adapter_model.bin` from checkpoint, run:

```
python convert.py --safetensors_path path_to_your_safetensors
```



## 5. Inference

After model training, run the prediction script:

```
sh scripts/predict.sh
```

Detailed parameters are listed below:

```
CUDA_VISIBLE_DEVICES=0 python predict/predict.py \
    --model_name_or_path $model_name_or_path \
    --template llama2 \
    --finetuning_type lora \
    --predicted_input_filename path_to_dataset.json \
    --checkpoint_dir path_to_checkpoint \
    --quantization_bit 4 \
    --predicted_out_filename predict_result.sql >> ${pred_log}
```



## 6. Evaluation

Download nltk:

```
import nltk
nltk.download('punkt_tap')
```

Or download `punkt_tab` from [nltk](https://www.nltk.org/nltk_data/). Then unzip it and put it in `miniconda3/envs/text2sql/nltk_data/tokenizers/`.

To evaluate the prediction results, run the script:

```
sh scripts/evaluate.sh
```

Detailed parameters are listed below:

```
python eval/evaluation.py 
    --input path_to_predict_result.sql 
    --gold path_to_gold_queries.sql 
    --db path_to_database 
    --table path_to_tables.json 
    --etype all
    [--plug_value False]  # whether to plug in the gold value into the predicted query
    [--keep_distinct False]  # whether to keep distinct keyword during evaluation
    [--progress_bar_for_each_datapoint False]  # whether to print progress bar of running test inputs
    [--natsql False]  # whether to convert natsql to sql and evaluate the converted sql
```



## 7. Experiment

| Spider                    | easy      | medium    | hard      | extra     | all       |
| ------------------------- | --------- | --------- | --------- | --------- | --------- |
| **Count**                 | 470       | 857       | 463       | 357       | 2147      |
| **Execution Accuracy**    |           |           |           |           |           |
| Base                      | 0.577     | 0.352     | 0.201     | 0.066     | 0.335     |
| SFT (Code Representation) | 0.883     | 0.750     | **0.659** | 0.571     | 0.730     |
| SFT (Text Representation) | **0.896** | **0.777** | 0.652     | **0.608** | **0.748** |

(To be completed, few-shot and zero-shot)



## 8. Acknowledgement

[LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory/tree/main), [DB-GPT-Hub](https://github.com/eosphoros-ai/DB-GPT-Hub/tree/main), [DAIL-SQL](https://github.com/BeachWang/DAIL-SQL/tree/main) and [test-suite-sql-eval](https://github.com/taoyds/test-suite-sql-eval)