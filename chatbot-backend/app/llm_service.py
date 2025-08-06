from transformers import pipeline

# Load a lightweight model
generator = pipeline("text-generation", model="google/flan-t5-base")

def generate_response(prompt: str) -> str:
    result = generator(prompt, max_length=100, do_sample=True, temperature=0.7)
    return result[0]['generated_text']
