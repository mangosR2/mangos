#!/bin/sh
PREFIX=${HOME}
CONFDIR=${HOME}/etc
CONF_OPTS="-DPCH=0 
           -DDEBUG=0
           -DACE_USE_EXTERNAL=1
           -DUSE_STD_MALLOC=1
           -DNDEBUG=0
           -DCMAKE_BUILD_TYPE=Release
           -DCMAKE_BUILD_TOOL='make -j4'"

CPPFLAGS="-march=native -O2 -ggdb -pipe -D_LARGEFILE_SOURCE -fno-inline -frename-registers -fno-strict-aliasing -fno-strength-reduce -fno-delete-null-pointer-checks -ffast-math -finput-charset=utf-8 -fexec-charset=utf-8"
CXXFLAGS="-march=native -O2 -ggdb -pipe -D_LARGEFILE_SOURCE -fno-inline -frename-registers -fno-strict-aliasing -fno-strength-reduce -fno-delete-null-pointer-checks -ffast-math -finput-charset=utf-8 -fexec-charset=utf-8"

rm  -Rf build &&
mkdir build &&
cd build &&

cmake \
    ${CONF_OPTS} \
    -DSYSCONFDIR="${CONFDIR}" \
    -DPREFIX="${PREFIX}" \
    -DCMAKE_C_FLAGS_RELEASE:STRING="${CPPFLAGS}" \
    -DCMAKE_CXX_FLAGS_RELEASE:STRING="${CXXFLAGS}" \
    ..
