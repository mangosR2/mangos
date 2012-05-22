#!/bin/bash
# Manually set version of ACE before script run
#
version="6.0.3"
prefix="/usr/local"
#
wget http://download.dre.vanderbilt.edu/previous_versions/ACE-$version.tar.gz
tar xvfz ACE-$version.tar.gz
cd ACE_wrappers
mkdir objdir
cd objdir
../configure --disable-ace-tests --disable-ace-examples --prefix=$prefix
make -j2
make install
cd /usr/lib
ln -s $prefix/lib/libACE.so .
ln -s $prefix/lib/libACE-$version.so .
cd /usr/include/
ln -s $prefix/include/ace/ .
