# OpenVLA: An Open-Source Vision-Language-Action Model
This repository was built for train and inference [openVLA git](https://github.com/openvla/openvla).

## 1. Getting Started
```bash
git clone https://github.com/qnrwjd78/openVLA.git
cd openVLA

git submodule update --init --recursive
```
> **[Base Setting]**: 현재 디렉토리(openVLA) 기준으로 worksapce 마운트하여 컨테이너 실행. 실행시에는 {your_name} 대신 이름으로 바꿔서 실행

```bash
# build Dockerfile
docker build -t ciplab/{your_name}_openvla_env:cu121 .

# run container
docker run --gpus all -it --name {your_name}_openvla_env --rm -v $(pwd):/workspace ciplab/{your_name}_openvla_env:cu121
```

> **[LIBERO Simulation Setting]**: repository 마운트 기준으로 setting 하기때문에 기본 디렉토리를 전부 worksapce로 셋팅한 내용. \\ 경로가 바뀐다면 이에 맞추서 바꿔야 함

```bash
cd /workspace/repo/libero
pip install -e .

# install additional requirenments
pip install -r /workspace/repo/openvla/experiments/robot/libero/libero_requirements.txt

```

## 2. Weight Download
