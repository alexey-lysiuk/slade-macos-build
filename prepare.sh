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

SFML_INC_DIR=$INC_DIR/SFML

$CMAKE_EXE ../SLADE -GXcode \
	-DCMAKE_OSX_ARCHITECTURES=x86_64 \
	-DCMAKE_OSX_DEPLOYMENT_TARGET=10.7 \
	-DCMAKE_CXX_FLAGS="-Wno-unused-variable -Wno-unused-private-field" \
	-DCMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD="c++0x" \
	-DCMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY="libc++" \
	-DwxWidgets_CONFIG_EXECUTABLE="${BIN_DIR}/wx-config" \
	-DPKG_CONFIG_EXECUTABLE="${BIN_DIR}/pkg-config" \
	-DSFML_STATIC=ON \
	-DSFML_NETWORK_INCLUDE_DIR="${SFML_INC_DIR}" \
	-DSFML_AUDIO_INCLUDE_DIR="${SFML_INC_DIR}" \
	-DSFML_GRAPHICS_INCLUDE_DIR="${SFML_INC_DIR}" \
	-DSFML_SYSTEM_INCLUDE_DIR="${SFML_INC_DIR}" \
	-DSFML_WINDOW_INCLUDE_DIR="${SFML_INC_DIR}" \
	-DSFML_NETWORK_LIBRARY_STATIC_NONDEBUG="${LIB_DIR}/libsfml-network-s.a" \
	-DSFML_AUDIO_LIBRARY_STATIC_NONDEBUG="${LIB_DIR}/libsfml-audio-s.a" \
	-DSFML_GRAPHICS_LIBRARY_STATIC_NONDEBUG="${LIB_DIR}/libsfml-graphics-s.a" \
	-DSFML_SYSTEM_LIBRARY_STATIC_NONDEBUG="${LIB_DIR}/libsfml-system-s.a" \
	-DSFML_WINDOW_LIBRARY_STATIC_NONDEBUG="${LIB_DIR}/libsfml-window-s.a" \
	-DFLUIDSYNTH_INCLUDE_DIR="${INC_DIR}" \
	-DFLUIDSYNTH_LIBRARIES="${LIB_DIR}/libfluidsynth.a" \
	-DFREEIMAGE_INCLUDE_DIR="${INC_DIR}" \
	-DFREEIMAGE_LIBRARIES="${LIB_DIR}/libfreeimage.a" \
	-DFREETYPE_INCLUDE_DIRS="${INC_DIR}/freetype2" \
	-DFREETYPE_LIBRARY="${LIB_DIR}/libfreetype.a" \
	-DFTGL_INCLUDE_DIR="${INC_DIR}" \
	-DFTGL_LIBRARIES="${LIB_DIR}/libftgl.a" \
	-DGLEW_INCLUDE_DIR="${INC_DIR}" \
	-DGLEW_LIBRARY="${LIB_DIR}/libGLEW.a" \
	-DCMAKE_EXE_LINKER_FLAGS="-framework AudioUnit -framework CoreAudio -framework CoreMIDI -framework OpenAL -framework QTKit -L\"${LIB_DIR}\" -lintl -lglib -logg -lvorbis -lvorbisenc -lvorbisfile -lFLAC -lsndfile"
