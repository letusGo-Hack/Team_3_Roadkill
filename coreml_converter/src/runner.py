import dataclasses
import logging
import os

import torch
import torch.nn as nn

from .const import RESULT_DIR
from .converter import Converter
from .models import Models, ModelLoader
from .optimizer import quantize

_LOGGER = logging.getLogger(__name__)


@dataclasses.dataclass
class RuntimeConfig:
    device: torch.device
    need_optimize: bool = False


def _weight_path(runtime_config: RuntimeConfig, filename: str) -> str:
    return os.path.join(runtime_config.weight_dir, filename) + runtime_config.weight_ext


def _input_size(model: nn.Module) -> torch.Size:
    param = next(model.parameters())
    return torch.Size((1, param.size(-1)))


def run(runtime_config: RuntimeConfig) -> int:
    """Run Converter."""
    _LOGGER.info("Start running converter...")

    converter = Converter()

    _model = Models.KOBART

    model_loader = ModelLoader()
    tokenizer, model = model_loader.load(_model)

    _LOGGER.info(f"Start converting with model {_model.value}")

    # Prepare addtional args for convert.
    # input_size = _input_size(model)

    _text = "This is a sample text to trace the BART model."
    inputs = tokenizer(
        _text,
        return_tensors="pt",
        padding="max_length",
        truncation=True,
        max_length=1026,
    )
    input_ids = inputs["input_ids"]
    attention_mask = inputs["attention_mask"]
    example_inputs = {"input_ids": input_ids, "attention_mask": attention_mask}

    # Convert weight-summed model to MLProgram type.
    ml_model, ext = converter.convert(model, example_inputs)

    # # Optimize for mobile environment.
    if runtime_config.need_optimize:
        ml_model = quantize(ml_model)

    # Save converted model as ".mlpackage" file.
    model_filename = _model.value.split("/")[-1]
    result_path = os.path.join(RESULT_DIR, model_filename) + ext
    _LOGGER.info(f"Saving result to {result_path}")
    ml_model.save(result_path)  # type: ignore

    return 1
