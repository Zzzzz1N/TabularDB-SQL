import torch
from safetensors.torch import load_file
import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument(
    "--safetensors_path", help="Input safetensors file path", default=""
)
args = parser.parse_args()

safetensors_file_path = os.path.join(args.safetensors_path, "adapter_model.safetensors")
pt_state_dict = load_file(safetensors_file_path, device="cpu")
bin_path = os.path.join(args.safetensors_path, "adapter_model.bin")
torch.save(pt_state_dict, bin_path)
print("Done!")