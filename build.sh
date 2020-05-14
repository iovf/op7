#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper

echo
echo "Issue Build Commands"
echo

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/root/build_tool/clang-383902/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/root/build_tool/aarch64/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=/root/build_tool/arm/bin/arm-linux-androideabi-
export LD_LIBRARY_PATH=/root/build_tool/clang-383902/bin/lib64:$LD_LIBRARY_PATH

echo
echo "Set DEFCONFIG"
echo 
make CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip O=out 666_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip O=out -j12
