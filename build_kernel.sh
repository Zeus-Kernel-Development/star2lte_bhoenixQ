#!/bin/bash

#Build kernel
export ARCH=arm64
export CROSS_COMPILE=~/kernel/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

export ANDROID_MAJOR_VERSION=q

make ARCH=arm64 exynos9810-star2lte_defconfig
make ARCH=arm64 -j64
DTS=arch/arm64/boot/dts/exynos
make exynos9810-star2lte_eur_open_16.dtb exynos9810-star2lte_eur_open_17.dtb exynos9810-star2lte_eur_open_18.dtb exynos9810-star2lte_eur_open_20.dtb exynos9810-star2lte_eur_open_23.dtb exynos9810-star2lte_eur_open_26.dtb 

# Make DT.img
./scripts/dtbTool/dtbTool -o ./boot.img-dt -d $DTS/ -s 2048

# Cleanup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb

# Copy files
cp arch/arm64/boot/Image boot.img-zImage
