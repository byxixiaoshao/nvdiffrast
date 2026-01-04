#!/bin/bash

# 仅修改CUDA版本号（从v12.8→v13.0），其余路径写法/转义方式完全复用cu128脚本
CUDA_HOME=/c/Program\ Files/NVIDIA\ GPU\ Computing\ Toolkit/CUDA/v13.0
PATH=${CUDA_HOME}/bin:$PATH
PATH=/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/BuildTools/MSBuild/15.0/Bin:$PATH

export FORCE_CUDA=1
# 可选：保留原"6.0+PTX"，也可扩展架构（兼容更多GPU，不影响编译），以下两种写法任选其一：
# 写法1（完全和cu128一致）：
export TORCH_CUDA_ARCH_LIST="6.0+PTX"
# 写法2（扩展架构，兼容RTX 30/40系等，推荐但非必须）：
# export TORCH_CUDA_ARCH_LIST="6.0;6.1;7.0;7.5;8.0;8.6;8.9;9.0+PTX"
