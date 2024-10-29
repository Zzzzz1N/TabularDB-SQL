# evaluate model on spider test set
python eval/evaluation.py 
    --input /root/autodl-fs/output/codellama-13b/predict/pred_spider_test_codellama13b_code.sql 
    --gold /root/autodl-fs/dataset/spider/test_gold.sql 
    --db /root/autodl-fs/dataset/spider/test_database 
    --table /root/autodl-fs/dataset/spider/test_tables.json 
    --etype all 
    --progress_bar_for_each_datapoint