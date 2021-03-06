#!/bin/bash

git clone https://github.com/dmalhotra/pvfmm.git
cd pvfmm

INSTALL_DIR=$WORK/packages/pvfmm
PRECOMP_DIR=${INSTALL_DIR}/share/pvfmm

./autogen.sh
# maverick
#./configure CXXFLAGS="-wd3218 -wd2570 -I$TACC_MKL_INC -DFFTW3_MKL -DMPICH_IGNORE_CXX_SEEK -DMPICH_SKIP_MPICXX" F77=ifort FFLAGS=" " FLIBS=" " --with-fftw-include="$TACC_MKL_INC/fftw" --with-fftw-lib="-mkl" --with-precomp-dir=${PRECOMP_DIR} --prefix=${INSTALL_DIR}
#stampede need to load intel15, impi 5
./configure CXXFLAGS="-mavx -wd3218 -wd2570 -no-offload" --with-fftw="$TACC_FFTW3_DIR" FLIBS=" " --with-precomp-dir=${PRECOMP_DIR} --prefix=${INSTALL_DIR}


make all
make install
