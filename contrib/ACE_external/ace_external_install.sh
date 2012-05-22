#!/bin/bash
#
# Manually set version of ACE before script run!
# script usable for ACE versions 6.0.6 and above
# insert your directories here
# DO NOT FORGET remove preview version of ACE!
#

version="6.1.1"
INSTALL_PREFIX=/usr/local; export INSTALL_PREFIX
build_prefix="/usr/local/src"

#
ACE_ROOT=$build_prefix/ACE_wrappers; export ACE_ROOT

setenv LD_LIBRARY_PATH $ACE_ROOT/lib:$LD_LIBRARY_PATH

if [ ! -d $build_prefix ]; then
    mkdir $build_prefix
    fi

cd $build_prefix
wget http://download.dre.vanderbilt.edu/previous_versions/ACE-$version.tar.gz -P$build_prefix
tar xvfz ACE-$version.tar.gz

cd $ACE_ROOT

echo '#include "ace/config-linux.h"' > $ACE_ROOT/ace/config.h
echo 'include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU' > $ACE_ROOT/include/makeinclude/platform_macros.GNU

make -j2 ACE TP_Reactor
make install ACE TP_Reactor
