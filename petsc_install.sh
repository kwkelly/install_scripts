#!/bin/bash

PETSC_ARCH=intel
PRECISION=double
SCALAR=real
INSTALL_PREFIX=$WORK/packages

PETSC_VERSION=3.5.3
PETSC_URL=http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.5.3.tar.gz

wget -O petsc.tar.gz ${PETSC_URL}
mkdir petsc
tar xvzf petsc.tar.gz -C petsc --strip-components 1

cd petsc

PETSC_DIR=$(pwd)
#export PETSC_DIR=${INSTALL_PREFIX}/petsc-${PETSCVERSION}

echo ; echo "Configuring version=${PETSC_VERSION} with arch=${PETSC_ARCH}, precision=${PRECISION}, and scalar type=${SCALAR}" ; echo; echo "Installing to ${INSTALL_PREFIX}"; echo ;
./configure \
--with-precision=${PRECISION} \
--with-blas-lapack-dir=${TACC_MKL_LIB} \
--with-scalar-type=${SCALAR} \
--prefix=${INSTALL_PREFIX}/petsc \
--with-cxx-dialect=C++11

make PETSC_DIR=${PETSC_DIR} PETSC_ARCH=${PETSC_ARCH} all
make PETSC_DIR=${PETSC_DIR} PETSC_ARCH=${PETSC_ARCH} install
