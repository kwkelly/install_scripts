#!/bin/bash

INSTALL_DIR=$WORK/packages/elemental
THIS_DIR=$(pwd)
TOOLCHAIN=$THIS_DIR/Maverick-intel-impi-mkl.cmake
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

cmake -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR -DINSTALL_PYTHON_PACKAGE=FALSE ..

make install
