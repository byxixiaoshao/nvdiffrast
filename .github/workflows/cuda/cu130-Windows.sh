#!/bin/bash

# 安装NVIDIA驱动依赖DLL（复用原驱动包，兼容CUDA 13.0）
curl -k -L "https://drive.google.com/u/0/uc?id=1injUyo3lnarMgWyRcXqKg4UGnN0ysmuq&export=download" --output "/tmp/gpu_driver_dlls.zip"
7z x "/tmp/gpu_driver_dlls.zip" -o"/c/Windows/System32"

# 配置CUDA 13.0版本参数
export CUDA_SHORT=13.0
# CUDA 13.0 Windows官方安装包地址（NVIDIA官方稳定版）
export CUDA_URL=https://developer.download.nvidia.com/compute/cuda/${CUDA_SHORT}.0/local_installers
export CUDA_FILE=cuda_${CUDA_SHORT}.0_551.23_windows.exe

# 下载并静默安装CUDA 13.0（仅安装编译必需组件，避免冗余）
curl -k -L "${CUDA_URL}/${CUDA_FILE}" --output "${CUDA_FILE}"
echo ""
echo "Installing CUDA ${CUDA_SHORT} from ${CUDA_FILE}..."
PowerShell -Command "Start-Process -FilePath \"${CUDA_FILE}\" -ArgumentList \"-s nvcc_${CUDA_SHORT} cuobjdump_${CUDA_SHORT} nvprune_${CUDA_SHORT} cupti_${CUDA_SHORT} cublas_dev_${CUDA_SHORT} cudart_${CUDA_SHORT} cufft_dev_${CUDA_SHORT} curand_dev_${CUDA_SHORT} cusolver_dev_${CUDA_SHORT} cusparse_dev_${CUDA_SHORT} thrust_${CUDA_SHORT} npp_dev_${CUDA_SHORT} nvrtc_dev_${CUDA_SHORT} nvml_dev_${CUDA_SHORT}\" -Wait -NoNewWindow"
echo "CUDA ${CUDA_SHORT} installation completed!"

# 清理安装包，减少artifact体积
rm -f "${CUDA_FILE}"
