from huggingface_hub import snapshot_download

local_dir = "/workspace/weights/openvla-7b-finetuned-libero-spatial"

snapshot_download(
    repo_id="openvla/openvla-7b-finetuned-libero-spatial",
    local_dir=local_dir,
    local_dir_use_symlinks=False,
)

print(f"Downloaded to: {local_dir}")