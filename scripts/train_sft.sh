# wandb offline # Close wandb

current_date=$(date +"%Y%m%d_%H%M")
train_log="/root/autodl-fs/logs/codellama-13b/train_sft_test_${current_date}.log"
start_time=$(date +%s)
echo " Train Start time: $(date -d @$start_time +'%Y-%m-%d %H:%M:%S')" >>${train_log}

# default train , zero-shot, 
num_shot=0

dataset="spider_train_text"

model_name_or_path="/root/autodl-fs/model/codellama-13b-instruction-hf"
output_dir="/root/autodl-fs/output/codellama-13b/CodeLlama-13b-sql-qlora"

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
    # --bf16#v100不支持bf16
    
echo "############train end###############" >>${train_log}
echo "Train End time: $(date)" >>${train_log}
end_time=$(date +%s)
duration=$((end_time - start_time))
hours=$((duration / 3600))
min=$(( (duration % 3600) / 60))
echo "Time elapsed: ${hour}  hour $min min " >>${train_log}


# 多卡，deepseed启动
# deepspeed --num_gpus 2  dbgpt_hub_sql/train/sft_train.py \
#     --deepspeed dbgpt_hub_sql/configs/stage2.json \
#     --quantization_bit 4 \
#     --model_name_or_path /home/model_files/Llama-2-13b-chat-hf \
#     --do_train \
#     --dataset example_text2sql_train \
#     --max_source_length 1024 \
#     --max_target_length 512 \
#     --template llama2 \
#     --finetuning_type lora \
#     --lora_rank 64 \
#     --lora_alpha 32 \
#     --lora_target q_proj,v_proj \
#     --output_dir dbgpt_hub_sql/output/adapter/llama2-13b-qlora_1024_epoch1_debug1008_withDeepseed_mulitCard \
#     --overwrite_cache \
#     --overwrite_output_dir \
#     --per_device_train_batch_size 1 \
#     --gradient_accumulation_steps 16 \
#     --lr_scheduler_type cosine_with_restarts \
#     --logging_steps 25 \
#     --save_steps 20 \
#     --learning_rate 2e-4 \
#     --num_train_epochs 0.1 \
#     --plot_loss \
#     --bf16 2>&1 | tee ${train_log}


# 多卡，deepseed，全量微调
# deepspeed --include localhost:4,5,6,7  dbgpt_hub_sql/train/sft_train.py \
#     --dataset example_text2sql_train \
#     --model_name_or_path CodeLlama-7b-Instruct-hf \
#     --do_train \
#     --finetuning_type full \
#     --max_source_length 2048 \
#     --max_target_length 512 \
#     --template llama2 \
#     --output_dir dbgpt_hub_sql/output/adapter/code-llama-7b-2048_epoch4_full \
#     --overwrite_cache \
#     --overwrite_output_dir \
#     --per_device_train_batch_size 4 \
#     --gradient_accumulation_steps 16 \
#     --lr_scheduler_type cosine_with_restarts \
#     --logging_steps 50 \
#     --learning_rate 2e-5 \
#     --num_train_epochs 4 \
#     --plot_loss \
#     --bf16 True\
#     --deepspeed dbgpt_hub_sql/configs/stage3.json 2>&1 | tee ${train_log}
