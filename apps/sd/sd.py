from fastapi import FastAPI, Query
from fastapi.responses import StreamingResponse
from diffusers import StableDiffusionPipeline
import torch
from io import BytesIO

# Initialize SD Turbo on CPU
device = "cpu"
pipe = StableDiffusionPipeline.from_pretrained(
    "stabilityai/stable-diffusion-turbo",
    torch_dtype=torch.float32,
    low_cpu_mem_usage=True  # requires accelerate
)
pipe = pipe.to(device)

app = FastAPI()

@app.get("/generate")
def generate_image(prompt: str = Query(..., description="Text prompt for image generation")):
    # Generate image
    image = pipe(prompt, height=128, width=128, num_inference_steps=15).images[0]

    # Encode as JPEG in memory
    buf = BytesIO()
    image.save(buf, format="JPEG")
    buf.seek(0)

    # Return raw JPEG bytes
    return StreamingResponse(buf, media_type="image/jpeg")
