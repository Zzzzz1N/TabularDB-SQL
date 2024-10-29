import argparse
import json
import os
import re
import sys

import jsonlines

ROOT_PATH = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(ROOT_PATH)

from configs.config import (
    DATA_PATH,
    INPUT_PROMPT,
    # INSTRUCTION_ONE_SHOT_PROMPT,
    INSTRUCTION_PROMPT,
    SQL_DATA_INFO,
)
from tqdm import tqdm


class ProcessSqlData:
    def __init__(
            self, test_file=None, num_shot=0, code_representation=False
    ) -> None:
        self.test_file = test_file
        self.num_shot = num_shot
        self.code_representation = code_representation

    def decode_json_file(
            self,
            data_file_list,
            table_file,
            db_folder_path,
            db_id_name,
            output_name,
    ):
        """
        TO DO:
            1.relevant prompt
            2.field information
        """

        if table_file.endswith(".jsonl"):
            tables = jsonlines.open(table_file)
            datas = []
            for data_file in data_file_list:
                datas.extend(jsonlines.open(data_file))

        elif table_file.endswith(".json"):
            tables = json.load(open(table_file))
            datas = []
            for data_file in data_file_list:
                datas.extend(json.load(open(data_file)))
        else:
            print("Unsupported file types")
            raise

        # process db_id's table and coloumns
        # NLP prompt
        db_dict = {}
        for item in tables:
            tables = item["table_names_original"]
            coloumns = item["column_names_original"][1:]
            primary_key = item["primary_keys"]
            foreign_keys = item["foreign_keys"]
            source = (
                    item["db_id"] + " contains tables such as " + ", ".join(tables) + ". "
            )
            for i, name in enumerate(tables):
                data = [coloumn[1] for coloumn in coloumns if coloumn[0] == i]
                source += (
                        "Table " + name + " has columns such as " + ", ".join(data) + ". "
                )

                # get primary key info
                for j in range(len(primary_key)):
                    if type(primary_key[j]) == int:
                        if coloumns[primary_key[j] - 1][0] == i:
                            source += (
                                    coloumns[primary_key[j] - 1][1]
                                    + " is the primary key."
                                    + "\n"
                            )
                    # combination primary key
                    elif type(primary_key[j]) == list:
                        combine_p = "The combination of ("
                        keys = []
                        for k in range(len(primary_key[j])):
                            if coloumns[primary_key[j][k] - 1][0] == i:
                                keys.append(coloumns[primary_key[j][k] - 1][1])
                        source += (
                                combine_p
                                + ", ".join(keys)
                                + ") are the primary key."
                                + "\n"
                        )
                    else:
                        print("not support type", type(primary_key[j]))
                        continue

            # get foreign key info
            for key in foreign_keys:
                source += (
                        "The "
                        + coloumns[key[0] - 1][1]
                        + " of "
                        + tables[coloumns[key[0] - 1][0]]
                        + " is the foreign key of "
                        + coloumns[key[1] - 1][1]
                        + " of "
                        + tables[coloumns[key[1] - 1][0]]
                        + ".\n"
                )

            db_dict[item["db_id"]] = source

        res = []
        base_instruction = INSTRUCTION_PROMPT
        # if self.num_shot == 1:
        #     base_instruction = INSTRUCTION_ONE_SHOT_PROMPT

        # wrong information
        art_str = [
            "I want you to act as a SQL terminal in front of an example database, you need only to return the sql command to me.Below is an instruction that describes a task, Write a response that appropriately completes the request.\n\"\n##Instruction:\n['CREATE TABLE \"Artists\" (\\n\"artistID\" int,\\n\"lname\" text,\\n\"fname\" text,\\n\"birthYear\" int,\\n\"deathYear\" int,\\nPRIMARY KEY (\"artistID\")\\n);', 'CREATE TABLE \"Paintings\" (\\n\"paintingID\" int,\\n\"title\" text,\\n\"year\" int,\\n\"height_mm\" int,\\n\"width_mm\" int,\\n\"medium\" text,\\n\"mediumOn\" text,\\n\"location\" text,\\n\"painterID\" int,\\nPRIMARY KEY (\"paintingID\"),\\nFOREIGN KEY (\"painterID\") REFERENCES \"Artists\"(\"artistID\")\\n);', 'CREATE TABLE \"Sculptures\" (\\n\"sculptureID\" int,\\n\"title\" text,\\n\"year\" int,\\n\"medium\" text,\\n\"location\" text,\\n\"sculptorID\" int,\\n\PRIMARY KEY (\"sculptureID\"),\\nFOREIGN KEY (\"sculptorID\") REFERENCES \"Artists\"(\"artistID\")\\n);']\n"]
        
        # wrong information
        ann_str = [
            "I want you to act as a SQL terminal in front of an example database, you need only to return the sql command to me.Below is an instruction that describes a task, Write a response that appropriately completes the request.\n\"\n##Instruction:\n['CREATE TABLE \"Affiliation\" (\\n\"affiliation_id\" int,\\n\"name\" text,\\n\"address\" text,\\nPRIMARY KEY (\"affiliation_id\")\\n);', 'CREATE TABLE \"Author\" (\\n\"author_id\" int,\\n\"name\" text,\\n\"email\" text,\\nPRIMARY KEY (\"author_id\")\\n);', 'CREATE TABLE \"Author_list\" (\\n\"paper_id\" int,\\n\"author_id\" int,\\n\"affiliation_id\" int,\\nPRIMARY KEY (\"paper_id\"),\\nFOREIGN KEY (\"affiliation_id\") REFERENCES \"Affiliation\"(\"affiliation_id\"),\\nFOREIGN KEY (\"author_id\") REFERENCES \"Author\"(\"author_id\"),\\nFOREIGN KEY (\"paper_id\") REFERENCES \"Paper\"(\"paper_id\")\\n);', 'CREATE TABLE \"Citation\" (\\n\"paper_id\" int,\\n\"cited_paper_id\" int,\\nPRIMARY KEY (\"paper_id\"),\\nFOREIGN KEY (\"cited_paper_id\") REFERENCES \"Paper\"(\"paper_id\"),\\nFOREIGN KEY (\"paper_id\") REFERENCES \"Paper\"(\"paper_id\")\\n);', 'CREATE TABLE \"Paper\" (\\n\"paper_id\" int,\\n\"title\" text,\\n\"venue\" text,\\n\"year\" int,\\nPRIMARY KEY (\"paper_id\")\\n);']\n"]

        for data in tqdm(datas):
            if data[db_id_name] in db_dict.keys():
                if self.code_representation:
                    db_path = os.path.join(db_folder_path, data[db_id_name])
                    sql_file_path = next(
                        (
                            file
                            for file in os.listdir(db_path)
                            if file.endswith(".sql")
                        ),
                        None,
                    )
                    if data[db_id_name] == 'aan_1':  # replace
                        input = {
                            "db_id": data[db_id_name],
                            "instruction": ann_str[0],
                            "input": INPUT_PROMPT.format(data["question"]),
                            "output": [],
                            "history": [],
                        }
                        res.append(input)
                        continue
                    if data[db_id_name] == 'art_1':  # replace
                        input = {
                            "db_id": data[db_id_name],
                            "instruction": art_str[0],
                            "input": INPUT_PROMPT.format(data["question"]),
                            "output": [],
                            "history": [],
                        }
                        res.append(input)
                        continue
                    if sql_file_path is None:
                        continue
                    schema_file_path = os.path.join(db_path, sql_file_path)
                    with open(schema_file_path, "r") as file:
                        schema_content = file.read()
                    create_statements = re.findall(
                        r"CREATE\s.*?;", schema_content, re.DOTALL | re.IGNORECASE
                    )
                    input = {
                        "db_id": data[db_id_name],
                        "instruction": INSTRUCTION_PROMPT.format(create_statements),
                        "input": INPUT_PROMPT.format(data["question"]),
                        "output": [],
                        "history": [],
                    }
                    res.append(input)
                else:
                    input = {
                        "db_id": data[db_id_name],
                        "instruction": base_instruction.format(
                            db_dict[data[db_id_name]]
                        ),
                        "input": INPUT_PROMPT.format(data["question"]),
                        "output": [],
                        "history": [],
                    }
                    res.append(input)
        return res

    def create_sft_raw_data(self):
        test_data = []
        for data_info in SQL_DATA_INFO:
            test_data_file_list = [
                os.path.join(DATA_PATH, data_info["data_source"], file)
                for file in data_info["test_file"]
            ]
            test_data.extend(
                self.decode_json_file(
                    data_file_list=test_data_file_list,
                    table_file=os.path.join(
                        DATA_PATH,
                        data_info["data_source"],
                        data_info["test_tables_file"],
                    ),
                    db_folder_path=os.path.join(
                        DATA_PATH,
                        data_info["data_source"],
                        "test_database",
                    ),
                    db_id_name=data_info["db_id_name"],
                    output_name=data_info["output_name"],
                )
            )
        with open(self.test_file, "w", encoding="utf-8") as s:
            json.dump(test_data, s, indent=4, ensure_ascii=False)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--code_representation", help="Enable code representation", default=False
    )
    args = parser.parse_args()

    output_test_file = os.path.join(DATA_PATH, "spider_process/spider_test_process.json")
    process = ProcessSqlData(
        test_file=output_test_file,
        code_representation=args.code_representation,
    )
    process.create_sft_raw_data()

    # one-shot
    # output_test_file_1shot = os.path.join(DATA_PATH, "spider_process/spider_test_process_1shot.json")
    # one_shot_precess = ProcessSqlData(
    #     test_file=output_test_file_1shot,
    #     num_shot=1,
    #     code_representation=args.code_representation,
    # )
    # one_shot_precess.create_sft_raw_data()
