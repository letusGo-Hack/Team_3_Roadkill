from transformers import PreTrainedTokenizerFast, BartForConditionalGeneration

from ..models import Models


class ModelLoader:
    def __init__(self):
        pass

    def load(
        self, model: Models
    ) -> tuple[PreTrainedTokenizerFast, BartForConditionalGeneration]:
        tokenizer = PreTrainedTokenizerFast.from_pretrained(model.value)
        model = BartForConditionalGeneration.from_pretrained(model.value)

        return (tokenizer, model)
