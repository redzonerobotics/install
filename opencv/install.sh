#!/bin/bash

cuda=$1

wget https://raw.githubusercontent.com/redzonerobotics/install/master/opencv/Makefile

if [[ $cuda == "cuda" ]]; then
    echo "make install_cuda ..."
    make install_cuda
elif [[ $cuda == "cuda_py" ]]; then
    echo "make install_cuda_py ..."
    make install_cuda_py
else 
    echo "make install ..."
    make install
fi

rm Makefile



