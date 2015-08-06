#!/bin/bash

INSTALL_DIR=$HOME/packages/elemental
CMAKE_BIN_DIR=$HOME/packages/cmake/bin/ # can be left blank if on system path
THIS_DIR=$(pwd)
<<<<<<< HEAD
TOOLCHAIN=$THIS_DIR/ronaldo.cmake
=======
TOOLCHAIN=$THIS_DIR/Maverick-intel-impi-mkl.cmake
>>>>>>> 268b32feda6c2e585489d8fc8cf2724e28f56e9a
DEV=true

if [ "$DEV" = true ] ; then
	git clone git://github.com/elemental/Elemental.git elemental
else
	ELEMENTAL_URL=http://libelemental.org/pub/releases/Elemental-0.85.tgz
	wget -O elemental.tar.gz ${ELEMENTAL_URL}
	mkdir elemental
	tar xvzf elemental.tar.gz -C elemental --strip-components 1
fi

cd elemental
mkdir build
cd build

${CMAKE_BIN_DIR}cmake -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR -DINSTALL_PYTHON_PACKAGE=FALSE -DCMAKE_INSTALL_RPATH=$INSTALL_DIR/lib -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE ..

make install
