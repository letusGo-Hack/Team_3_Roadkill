from typing import Any
import logging

import coremltools as ct
import torch.jit as jit
import torch.nn as nn
import numpy as np
from coremltools.models.model import MLModel

from .const import _MLPACKAGE_EXTENSION

_LOGGER = logging.getLogger(__name__)


class BartModelWrapper(nn.Module):
    def __init__(self, model):
        super().__init__()
        self.model = model

    def forward(self, input_ids, attention_mask):
        # Only return the logits or the desired output
        outputs = self.model(input_ids=input_ids, attention_mask=attention_mask)
        return outputs.logits


class Converter:
    def __init__(self):
        pass

    def convert(
        self, model: nn.Module, example_inputs: dict[str, Any]
    ) -> tuple[MLModel, str]:
        model.eval()

        model_wrapper = BartModelWrapper(model)

        traced_model = jit.trace(
            model_wrapper,
            (example_inputs["input_ids"], example_inputs["attention_mask"]),
        )

        _LOGGER.info("Start converting...")

        converted_model = ct.convert(
            model=traced_model,
            inputs=[
                ct.TensorType(name=m[0], shape=m[1].shape, dtype=np.int32)
                for m in example_inputs.items()
            ],
            outputs=[ct.TensorType(name="output")],
            minimum_deployment_target=ct.target.iOS15,
            convert_to="mlprogram",
            # compute_precision=ct.precision.FLOAT32,
        )

        if isinstance(converted_model, MLModel):
            return (converted_model, _MLPACKAGE_EXTENSION)
        else:
            raise ValueError("Format of converting output is not a `MLModel`.")
