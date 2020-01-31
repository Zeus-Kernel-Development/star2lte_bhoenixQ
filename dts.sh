#!/bin/bash

# Build
export CROSS_COMPILE=~/kernel/toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=q
export PLATFORM_VERSION=10.0.0
DTS=arch/arm64/boot/dts/exynos
make exynos9810-star2lte_eur_open_16.dtb exynos9810-star2lte_eur_open_17.dtb exynos9810-star2lte_eur_open_18.dtb exynos9810-star2lte_eur_open_20.dtb exynos9810-star2lte_eur_open_23.dtb exynos9810-star2lte_eur_open_26.dtb 

# Make DT.img
./scripts/dtbTool/dtbTool -o ./boot.img-dt -d $DTS/ -s 2048

# Cleanup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
