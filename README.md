# OpenVLA: An Open-Source Vision-Language-Action Model
This repository was built for train and inference [openVLA](https://github.com/openvla/openvla).

## 1. Getting Started
```bash
git clone https://github.com/qnrwjd78/openVLA.git
cd openVLA

git submodule update --init --recursive
```
> **1.1. Base Setting**: 현재 디렉토리(openVLA) 기준으로 worksapce 마운트하여 컨테이너 실행. 실행시에는 {your_name} 대신 이름으로 바꿔서 실행

```bash
# build Dockerfile
docker build -t ciplab/{your_name}_openvla_env:cu121 .

# run container
docker run --gpus all -it --name {your_name}_openvla_env --rm -v $(pwd):/workspace ciplab/{your_name}_openvla_env:cu121
```

> **1.2. LIBERO Simulation Setting**: repository 마운트 기준으로 setting 하기때문에 기본 디렉토리를 전부 worksapce로 셋팅한 내용. 경로가 바뀐다면 이에 맞추서 바꿔야 함

```bash
cd /workspace/repo/openvla
pip install -e .

cd /workspace/repo/libero
pip install -e .

# install additional requirenments
cd /workspace
pip install -r /workspace/libero_requirements.txt
```

## 2. Weight Download
We use [openvla-7b]
```bash
# download openvla-7b
python /workspace/scripts/download_weight.py
```

## 3. Inference
```bash
# export python path
echo 'export PYTHONPATH=/workspace/repo/libero:$PYTHONPATH' >> ~/.bashrc
source ~/.bashrc
```

**3.1. LIBERO inference** 
```bash
python /workspace/repo/openvla/experiments/robot/libero/run_libero_eval.py \
  --model_family openvla \
  --pretrained_checkpoint /workspace/weights/openvla-7b-finetuned-libero-spatial \
  --task_suite_name libero_spatial \
  --center_crop True \
  --num_trials_per_task 1
```