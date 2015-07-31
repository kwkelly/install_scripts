#!/bin/bash

git clone https://github.com/dmalhotra/pvfmm.git
cd pvfmm

INSTALL_DIR=$WORK/packages/pvfmm2
PRECOMP_DIR=${INSTALL_DIR}/share/pvfmm

./autogen.sh
# maverick
#./configure CXXFLAGS="-wd3218 -wd2570 -I$TACC_MKL_INC -DFFTW3_MKL -DMPICH_IGNORE_CXX_SEEK -DMPICH_SKIP_MPICXX" F77=ifort FFLAGS=" " FLIBS=" " --with-fftw-include="$TACC_MKL_INC/fftw" --with-fftw-lib="-mkl" -with-precomp-dir=${PRECOMP_DIR} --prefix=${INSTALL_DIR}
#stampede need to load intel15, impi 5
./configure --host=x86_64-k1om-linux CXXFLAGS="-mmic -wd3218 -wd2570 -I$TACC_MKL_INC -DFFTW3_MKL" F77=ifort FFLAGS="-mmic" FLIBS=" " --with-fftw-include="$TACC_MKL_INC/fftw" --with-fftw-lib="-mkl" -with-precomp-dir=${PRECOMP_DIR} --prefix=${INSTALL_DIR}

make all
make install
