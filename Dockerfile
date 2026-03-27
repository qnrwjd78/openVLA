FROM pytorch/pytorch:2.2.0-cuda12.1-cudnn8-devel

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ninja-build \
    git \
    tmux \
    ca-certificates \
    ffmpeg \
    libgl1-mesa-glx \
    libegl1 \
    libglew2.2 \
    libglfw3 \
    libosmesa6 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir \
        "numpy==1.26.4" \
        "torch==2.2.0" \
        "torchvision==0.17.0" \
        "torchaudio==2.2.0" \
        "transformers==4.40.1" \
        "tokenizers==0.19.1" \
        "timm==0.9.10" \
        "accelerate>=0.25.0" \
        "draccus==0.8.0" \
        "einops" \
        "huggingface_hub" \
        "json-numpy" \
        "jsonlines" \
        "matplotlib" \
        "peft==0.11.1" \
        "protobuf" \
        "rich" \
        "sentencepiece==0.1.99" \
        "wandb" \
        "tensorflow==2.15.0" \
        "tensorflow_datasets==4.9.3" \
        "tensorflow_graphics==2021.12.3" \
        "dlimp @ git+https://github.com/moojink/dlimp_openvla" \
        "pillow" \
        "packaging" \
        "ninja" \
        "bitsandbytes" && \
    pip install --no-cache-dir "flash-attn==2.5.5" --no-build-isolation

CMD ["/bin/bash"]