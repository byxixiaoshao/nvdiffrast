#!/bin/bash

# 1. 定义并EXPORT CUDA_HOME（关键：加export使其全局可见）
export CUDA_HOME=/c/Program\ Files/NVIDIA\ GPU\ Computing\ Toolkit/CUDA/v13.0
# 2. 拼接PATH并EXPORT（确保后续步骤能找到nvcc）
export PATH=${CUDA_HOME}/bin:$PATH
export PATH=/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/BuildTools/MSBuild/15.0/Bin:$PATH

# 3. 保留原环境变量
export FORCE_CUDA=1
export TORCH_CUDA_ARCH_LIST="6.0+PTX"

# 可选：验证CUDA_HOME和nvcc（便于调试）
echo "CUDA_HOME: $CUDA_HOME"
echo "nvcc path: $(which nvcc || echo 'nvcc not found')"
