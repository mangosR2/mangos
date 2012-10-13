#!/bin/bash
#
#

cd ~/Mangos-Sources/mangos

#patches=`find ./src/bindings/scriptdev2/patches -maxdepth 1 -name "*.patch"`
patches=`find ../patches -maxdepth 1 -name "*.patch"`

for j in $patches; do
    echo "Apply patch : "$j
    echo $(git apply <$j);
    echo $?
done

echo "Do compile now";

if [ ! -d ./build ]; then
    echo "Reconfiguration...";
    mkdir build
    cd build
    cmake \
    -DACE_USE_EXTERNAL=1 \
    -DUSE_STD_MALLOC=1 \
    -DPREFIX=/home/mangos \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS_RELEASE:STRING="-march=native -O2 -ggdb -pipe -D_LARGEFILE_SOURCE -frename-registers -fno-strict-aliasing -fno-strength-reduce -fno-delete-null-pointer-checks -finput-charset=utf-8 -fexec-charset=utf-8" \
    -DCMAKE_CXX_FLAGS_RELEASE:STRING="-march=native -O2 -ggdb -pipe -D_LARGEFILE_SOURCE -frename-registers -fno-strict-aliasing -fno-strength-reduce -fno-delete-null-pointer-checks -finput-charset=utf-8 -fexec-charset=utf-8" \
    -DPCH=1 \
    ..
else
    cd build
fi

nice -15 make
RETVAL=$?

echo

if [ $RETVAL -eq 0 ]; then
    echo "Compiled fine!";
    nice -15 make install
    RETVAL=$?
    if [ $RETVAL -eq 0 ]; then
        echo "Installed OK!";
        . ~/bin/auto_update.sh
        . ~/bin/world_restart.sh
    else
        echo "Install ERROR!";
    fi
else
    echo "Compilation ERROR!";
fi
