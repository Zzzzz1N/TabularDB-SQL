import os

# Path Config
ROOT_PATH = "/root/autodl-fs/"

# Model Path
MODEL_PATH = os.path.join(ROOT_PATH, "model/codellama-13b-instruction-hf")
ADAPTER_PATH = os.path.join(ROOT_PATH, "output/codellama-13b/CodeLlama-13b-sql-qlora-code/checkpoint-2000")
# MERGED_MODELS = os.path.join(ROOT_PATH, "output/merged_models")

# Data Path
DATA_PATH = os.path.join(ROOT_PATH, "dataset/")
PREDICTED_DATA_PATH = os.path.join(ROOT_PATH, "dataset/spider_process/text2sql_test_prompt.json")
PREDICTED_OUT_FILENAME = os.path.join(ROOT_PATH, "output/codellama-13b/predict/pred_codellama13b.sql")
OUT_DIR = os.path.join(ROOT_PATH, "output/codellama-13b/predict")

# Model Constants
IGNORE_INDEX = -100
DEFAULT_PAD_TOKEN = "[PAD]"
DEFAULT_EOS_TOKEN = "</s>"
DEFAULT_BOS_TOKEN = "<s>"
DEFAULT_UNK_TOKEN = "<unk>"


LOG_FILE_NAME = "trainer_log.jsonl"

# head_state_dict,model save name
VALUE_HEAD_FILE_NAME = "value_head.bin"

# output ,finetuning_args save_to_json name
FINETUNING_ARGS_NAME = "finetuning_args.json"

#  when prepare_model_for_training ,layer_norm_names
LAYERNORM_NAMES = ["norm", "ln_f", "ln_attn", "ln_mlp"]
EXT2TYPE = {"csv": "csv", "json": "json", "jsonl": "json", "txt": "text"}

# text2sql dataset information for processing sql data
# TODO: BIRD \ WiKiSQL \ ...
SQL_DATA_INFO = [
    {
        "data_source": "spider",
        "train_file": ["train_spider.json", "train_others.json"],
        "dev_file": ["dev.json"],
        "test_file": ["test.json"],
        "train_tables_file": "tables.json",
        "dev_tables_file": "tables.json",
        "test_tables_file": "test_tables.json",
        "db_id_name": "db_id",
        "output_name": "query",
        "is_multiple_turn": False,
    }
    # {
    #     "data_source": "bird",
    #     "train_file": ["train/train.json"],
    #     "dev_file": ["dev/dev.json"],
    #     "train_tables_file": "train/train_tables.json",
    #     "dev_tables_file": "dev/dev_tables.json",
    #     "db_id_name": "db_id",
    #     "output_name": "SQL",
    #     "is_multiple_turn": False,
    # }
    # ,
    # {
    #     "data_source": "chase",
    #     "train_file": ["Chase/chase_train.json"],
    #     "dev_file": ["Chase/chase_dev.json"],
    #     "tables_file": "Chase/chase_tables.json",
    #     "db_id_name": "database_id",
    #     "is_multiple_turn": True,
    # }
    # ,
    # {
    #     "data_source": "cosql_dataset",
    #     "train_file": ["sql_state_tracking/cosql_train.json"],
    #     "dev_file": ["sql_state_tracking/cosql_dev.json"],
    #     "tables_file": "tables.json",
    #     "db_id_name": "database_id",
    #     "is_multiple_turn": True,
    # }
    # ,
    # {
    # {
    #     "data_source": "sparc",
    #     "train_file": ["train.json"],
    #     "train_tables_file": "tables.json",
    #     "dev_tables_file": "tables.json",
    #     "dev_file": ["dev.json"],
    #     "db_id_name": "database_id",
    #     "is_multiple_turn": True,
    #     "output_name": "query",
    # }
]
INSTRUCTION_PROMPT = """\
I want you to act as a SQL terminal in front of an example database, \
you need only to return the sql command to me.Below is an instruction that describes a task, \
Write a response that appropriately completes the request.\n"
##Instruction:\n{}\n"""
INPUT_PROMPT = "###Input:\n{}\n\n###Response:"

# INSTRUCTION_ONE_SHOT_PROMPT = """\
# I want you to act as a SQL terminal in front of an example database. \
# You need only to return the sql command to me. \
# First, I will show you few examples of an instruction followed by the correct SQL response. \
# Then, I will give you a new instruction, and you should write the SQL response that appropriately completes the request.\
# \n### Example1 Instruction:
# The database contains tables such as employee, salary, and position. \
# Table employee has columns such as employee_id, name, age, and position_id. employee_id is the primary key. \
# Table salary has columns such as employee_id, amount, and date. employee_id is the primary key. \
# Table position has columns such as position_id, title, and department. position_id is the primary key. \
# The employee_id of salary is the foreign key of employee_id of employee. \
# The position_id of employee is the foreign key of position_id of position.\
# \n### Example1 Input:\nList the names and ages of employees in the 'Engineering' department.\n\
# \n### Example1 Response:\nSELECT employee.name, employee.age FROM employee JOIN position ON employee.position_id = position.position_id WHERE position.department = 'Engineering';\
# \n###New Instruction:\n{}\n"""

# EXAMPLES =[EXAMPLE1, EXAMPLE1]

# EXAMPLE1 = "\n### Example1 Input:\nList the names and ages of employees in the 'Engineering' department.\n\
# \n### Example1 Response:\nSELECT employee.name, employee.age FROM employee JOIN position ON employee.position_id = position.position_id WHERE position.department = 'Engineering';\
# \n###New Instruction:\n{}\n"

### test--------------------


# METHODS = ["full", "freeze", "lora"]

# STAGES = ["SFT", "Reward Modeling", "PPO", "DPO", "Pre-Training"]

# DATASET_STAGE_MAP = {
#     "SFT": "sft",
#     "Pre-Training": "pt",
#     "Reward Modeling": "rm",
#     "PPO": "sft",
#     "DPO": "rm",
# }

# SUPPORTED_MODELS = {
#     "LLaMA-7B": "huggyllama/llama-7b",
#     "LLaMA-13B": "huggyllama/llama-13b",
#     "LLaMA-30B": "huggyllama/llama-30b",
#     "LLaMA-65B": "huggyllama/llama-65b",
#     "LLaMA2-7B": "meta-llama/Llama-2-7b-hf",
#     "LLaMA2-13B": "meta-llama/Llama-2-13b-hf",
#     "LLaMA2-70B": "meta-llama/Llama-2-70b-hf",
#     "LLaMA2-7B-Chat": "meta-llama/Llama-2-7b-chat-hf",
#     "LLaMA2-13B-Chat": "meta-llama/Llama-2-13b-chat-hf",
#     "LLaMA2-70B-Chat": "meta-llama/Llama-2-70b-chat-hf",
#     "ChineseLLaMA2-7B": "ziqingyang/chinese-llama-2-7b",
#     "ChineseLLaMA2-13B": "ziqingyang/chinese-llama-2-13b",
#     "ChineseLLaMA2-7B-Chat": "ziqingyang/chinese-alpaca-2-7b",
#     "ChineseLLaMA2-13B-Chat": "ziqingyang/chinese-alpaca-2-13b",
#     "BLOOM-560M": "bigscience/bloom-560m",
#     "BLOOM-3B": "bigscience/bloom-3b",
#     "BLOOM-7B1": "bigscience/bloom-7b1",
#     "BLOOMZ-560M": "bigscience/bloomz-560m",
#     "BLOOMZ-3B": "bigscience/bloomz-3b",
#     "BLOOMZ-7B1-mt": "bigscience/bloomz-7b1-mt",
#     "Falcon-7B": "tiiuae/falcon-7b",
#     "Falcon-7B-Chat": "tiiuae/falcon-7b-instruct",
#     "Falcon-40B": "tiiuae/falcon-40b",
#     "Falcon-40B-Chat": "tiiuae/falcon-40b-instruct",
#     "Baichuan-7B": "baichuan-inc/Baichuan-7B",
#     "Baichuan-13B": "baichuan-inc/Baichuan-13B-Base",
#     "Baichuan-13B-Chat": "baichuan-inc/Baichuan-13B-Chat",
#     "Baichuan2-7B": "baichuan-inc/Baichuan2-7B-Base",
#     "Baichuan2-13B": "baichuan-inc/Baichuan2-13B-Base",
#     "Baichuan2-7B-Chat": "baichuan-inc/Baichuan2-7B-Chat",
#     "Baichuan2-13B-Chat": "baichuan-inc/Baichuan2-13B-Chat",
#     "InternLM-7B": "internlm/internlm-7b",
#     "InternLM-7B-Chat": "internlm/internlm-chat-7b",
#     "Qwen-7B": "Qwen/Qwen-7B",
#     "Qwen-7B-Chat": "Qwen/Qwen-7B-Chat",
#     "XVERSE-13B": "xverse/XVERSE-13B",
#     "ChatGLM2-6B-Chat": "THUDM/chatglm2-6b",
#     "ChatGLM3-6B-Base": "THUDM/chatglm3-6b-base",
#     "ChatGLM3-6B-Chat": "THUDM/chatglm3-6b"
# }

# DEFAULT_MODULE = {
#     "LLaMA": "q_proj,v_proj",
#     "LLaMA2": "q_proj,v_proj",
#     "ChineseLLaMA2": "q_proj,v_proj",
#     "BLOOM": "query_key_value",
#     "BLOOMZ": "query_key_value",
#     "Falcon": "query_key_value",
#     "Baichuan": "W_pack",
#     "Baichuan2": "W_pack",
#     "InternLM": "q_proj,v_proj",
#     "Qwen": "c_attn",
#     "XVERSE": "q_proj,v_proj",
#     "ChatGLM2": "query_key_value",
#     "ChatGLM3": "query_key_value",

# }

# DEFAULT_TEMPLATE = {
#     "LLaMA2": "llama2",
#     "ChineseLLaMA2": "llama2_zh",
#     "Baichuan": "baichuan",
#     "Baichuan2": "baichuan2",
#     "InternLM": "intern",
#     "Qwen": "chatml",
#     "ChatGLM2": "chatglm2",
#     "ChatGLM3": "chatglm3",

# }
