#!/bin/bash

INSTALL_PREFIX=$WORK/packages/git

GIT_URL=https://www.kernel.org/pub/software/scm/git/git-2.4.0.tar.gz

wget -O git.tar.gz ${GIT_URL}
mkdir git
tar xvzf git.tar.gz -C git --strip-components 1

cd git

make configure
./configure --prefix=${INSTALL_PREFIX}
make all
make install
