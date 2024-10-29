## shijian llama2 test

current_date=$(date +"%Y%m%d_%H%M")
pred_log="/root/autodl-fs/logs/codellama-13b/pred_test_${current_date}.log"
start_time=$(date +%s)
echo " Pred Start time: $(date -d @$start_time +'%Y-%m-%d %H:%M:%S')" >>${pred_log}

model_name_or_path="/root/autodl-fs/model/codellama-13b-instruction-hf"
output_dir="/root/autodl-fs/output/codellama-13b"
data_path="/root/autodl-fs/lib/TabularDB-SQL/data"

CUDA_VISIBLE_DEVICES=0  python predict/predict.py \
    --model_name_or_path $model_name_or_path \
    --template llama2 \
    --finetuning_type lora \
    --predicted_input_filename ${data_path}/spider_test_process_code.json \
    --checkpoint_dir ${output_dir}/CodeLlama-13b-sql-qlora-code/checkpoint-4000 \
    --quantization_bit 4 \
    --predicted_out_filename ${output_dir}/predict/pred_spider_test_codellama13b_code_4000.sql >> ${pred_log}

echo "############pred end###############" >>${pred_log}
echo "pred End time: $(date)" >>${pred_log}
end_time=$(date +%s)
duration=$((end_time - start_time))
hours=$((duration / 3600))
min=$(( (duration % 3600) / 60))
echo "Time elapsed: ${hour}  hour $min min " >>${pred_log}


# # wangzai baichua2_eval test
# CUDA_VISIBLE_DEVICES=0 python dbgpt_hub_sql/predict/predict.py \
#     --model_name_or_path /home/model/Baichuan2-13B-Chat \
#     --template baichuan2_eval \
#     --quantization_bit 4 \
#     --finetuning_type lora \
#     --checkpoint_dir dbgpt_hub_sql/output/adapter/baichuan2-13b-qlora 


## wangzai codellama2_pred test a100
# CUDA_VISIBLE_DEVICES=0,1  python dbgpt_hub_sql/predict/predict.py \
#     --model_name_or_path /home/model_files/codellama/CodeLlama-7b-Instruct-hf \
#     --template llama2 \
#     --finetuning_type lora \
#     --checkpoint_dir dbgpt_hub_sql/output/adapter/code_llama_7b-qlora