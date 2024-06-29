import coremltools.optimize.coreml as cto
from coremltools.models.model import MLModel


def quantize(model: MLModel) -> MLModel:
    op_config = cto.OpLinearQuantizerConfig(
        mode="linear_symmetric", weight_threshold=512
    )
    config = cto.OptimizationConfig(global_config=op_config)

    quantized_model = cto.linear_quantize_weights(model, config=config)

    if isinstance(quantized_model, MLModel):
        return quantized_model
    else:
        raise ValueError("Failed to optimize by quantizing.")
