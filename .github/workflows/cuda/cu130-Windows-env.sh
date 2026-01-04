#!/bin/bash

# 配置CUDA 13.0核心环境变量
CUDA_HOME=/c/Program\ Files/NVIDIA\ GPU\ Computing\ Toolkit/CUDA/v13.0
# 把CUDA二进制目录加入PATH（优先加载nvcc等编译工具）
PATH=${CUDA_HOME}/bin:$PATH
# 配置VS BuildTools路径（Windows C++编译必需）
PATH=/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/BuildTools/MSBuild/15.0/Bin:$PATH

# 强制启用CUDA编译、指定CUDA架构兼容范围（适配主流NVIDIA GPU）
export FORCE_CUDA=1
# 支持6.0+架构（覆盖GTX 10系及以上、RTX全系列），可根据需要扩展
export TORCH_CUDA_ARCH_LIST="6.0;6.1;7.0;7.5;8.0;8.6;8.9;9.0+PTX"

# 验证CUDA环境（可选，便于调试）
echo "CUDA_HOME: ${CUDA_HOME}"
echo "PATH: ${PATH}"
nvcc --version  # 打印nvcc版本，确认安装成功
