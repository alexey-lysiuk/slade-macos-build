#!/bin/sh

set -o errexit

cd "`dirname \"$0\"`"

ROOT_DIR=`pwd`

if [ ! -e SLADE ]; then
	git clone https://github.com/sirjuddington/SLADE.git
fi

if [ -n "$1" ]; then
	cd SLADE
	git checkout "tags/$1"
	cd ..
fi

if [ ! -e build ]; then
	mkdir build
fi

cd build

set +o errexit
CMAKE_EXE=`which cmake`
set -o errexit

if [ -z $CMAKE_EXE ]; then
	CMAKE_EXE=/Applications/CMake.app/Contents/bin/cmake
fi

BIN_DIR=$ROOT_DIR/thirdparty/bin
INC_DIR=$ROOT_DIR/thirdparty/include
LIB_DIR=$ROOT_DIR/thirdparty/lib

$CMAKE_EXE ../SLADE -GXcode \
	-DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 \
	-DCMAKE_INCLUDE_PATH="${INC_DIR}" \
	-DCMAKE_LIBRARY_PATH="${LIB_DIR}" \
	-DWITH_WXPATH="${BIN_DIR}" \
	-DSFML_STATIC=ON
	
# TODO: -DCMAKE_EXE_LINKER_FLAGS=
