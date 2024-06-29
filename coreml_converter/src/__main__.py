import logging

import torch

from .runner import RuntimeConfig, run

logging.basicConfig(level=logging.INFO)

if __name__ == "__main__":
    run_config = RuntimeConfig(device=torch.device("mps"), need_optimize=False)

    run(runtime_config=run_config)
