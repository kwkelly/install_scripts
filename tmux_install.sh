#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $PREFIX_ROOT/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

# user should set this prefix
PREFIX_ROOT=$WORK/packages/tmux

# Links to the dependencies. May need to be updates in the future
TMUX_LINK=http://sourceforge.net/projects/tmux/files/tmux/tmux-1.9/tmux-1.9a.tar.gz/download
LIBEVENT_LINK=https://github.com/downloads/libevent/libevent/libevent-2.0.19-stable.tar.gz
if [ $(uname) == 'Darwin' ];
then
	NCURSES_LINK=ftp://invisible-island.net/ncurses/current/ncurses-5.9-20150329.tgz
else
	NCURSES_LINK=ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz
fi

# create our directories
mkdir -p $PREFIX_ROOT $PREFIX_ROOT/tmux_tmp
cd $PREFIX_ROOT/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget -O tmux.tar.gz ${TMUX_LINK}
wget -O libevent.tar.gz ${LIBEVENT_LINK}
wget -O ncurses.tar.gz ${NCURSES_LINK}

# extract files, configure, and compile

############
# libevent #
############
mkdir -p libevent && tar xzvf libevent.tar.gz -C libevent --strip-components 1
cd libevent
./configure --prefix=$PREFIX_ROOT --disable-shared
make
make install
cd ..

############
# ncurses  #
############
mkdir -p ncurses && tar xzvf ncurses.tar.gz -C ncurses --strip-components 1
cd ncurses
./configure --prefix=$PREFIX_ROOT
make
make install
cd ..

############
# tmux     #
############
mkdir -p tmux && tar xzvf tmux.tar.gz -C tmux --strip-components 1
cd tmux
./configure CFLAGS="-I$PREFIX_ROOT/include -I$PREFIX_ROOT/include/ncurses" LDFLAGS="-L$PREFIX_ROOT/lib -L$HPREFIX_ROOT/include/ncurses -L$PREFIX_ROOT/include"
CPPFLAGS="-I$PREFIX_ROOT/include -I$PREFIX_ROOT/include/ncurses" LDFLAGS="-static -L$PREFIX_ROOT/include -L$PREFIX_ROOT/include/ncurses -L$PREFIX_ROOT/lib" make
cp tmux $PREFIX_ROOT/bin
cd ..

# cleanup
rm -rf $PREFIX_ROOT/tmux_tmp

echo "$PREFIX_ROOT/bin/tmux is now available. You can optionally add $PREFIX_ROOT/bin to your PATH."
