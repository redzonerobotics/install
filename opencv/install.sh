cuda=$1

wget -O https://raw.githubusercontent.com/redzonerobotics/install/master/opencv/Makefile

if [[ $cuda == "cuda" ]]; then
    echo "make install_cuda ..."
    make install_cuda > opencv_build_cuda.log
elif [[ $cuda == "cuda_py" ]]; then
    echo "make install_cuda_py ..."
    make install_cuda_py > opencv_build_cuda_py.log
else 
    echo "make build ..."
    make build > opencv_build.log
fi

rm Makefile



