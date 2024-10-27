#!/bin/bash

set -e

build() {
    platform=$1
    mkdir -p "$platform"
    cd "$platform"
    
    if [ "$platform" == "windows" ]; then
        cmake -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
              -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
              -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=../release \
              ../..
    else
        cmake -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=../release \
              ../..
    fi

    make
    cd ..
}

rm -rf build
mkdir build
cd build

build linux
build windows

echo "Build completed!"