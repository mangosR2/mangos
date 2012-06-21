#!/bin/bash
################################################################################################
# bash script for compilation mangosR2 utility in MINGW32/MINGW64 environment. by /dev/rsa
################################################################################################
#check path of running
if [ ! -d ./.git ]; then
    echo $"Please, run this script in mangos root folder!"
    exit 2
fi;

case "$1" in
    win32|32)
    PLATFORM=i686
    ;;
    win64|64)
    PLATFORM=x86_64
    ;;
    plain|none)
    PLATFORM=build
    ;;
    *)
    echo $"Usage: $0 {win32|win64|plain}"
    exit 2
esac
################################################################################################
#make binary storage
BINARY_PATH=bin
if [ ! -d ./$BINARY_PATH ]; then
    mkdir $BINARY_PATH
fi;

if [ ! -d ./$BINARY_PATH/$PLATFORM ]; then
    mkdir $BINARY_PATH/$PLATFORM
fi;
################################################################################################
# Make extractor
cd contrib/extractor
make clean
if [ ! -d ./$PLATFORM ]; then
    mkdir $PLATFORM
fi;
cd $PLATFORM
if [ "$PLATFORM" != "build" ]; then
    cmake -DCMAKE_TOOLCHAIN_FILE=../../../cmake/mingw32-$PLATFORM.cmake ..
else
    cmake ..
fi

make

if [ "$PLATFORM" != "build" ]; then
    cp ./ad.exe ../../../$BINARY_PATH/$PLATFORM/
    cp /usr/$PLATFORM-w64-mingw32/sys-root/mingw/bin/zlib1.dll ../../../$BINARY_PATH/$PLATFORM/
    cp /usr/$PLATFORM-w64-mingw32/sys-root/mingw/bin/libgcc_s_sjlj-1.dll ../../../$BINARY_PATH/$PLATFORM/
    cp /usr/$PLATFORM-w64-mingw32/sys-root/mingw/bin/libstdc++-6.dll ../../../$BINARY_PATH/$PLATFORM/
else
    cp ./ad ../../../$BINARY_PATH/$PLATFORM
fi
cd ../../..
################################################################################################
# Make libmpq
cd dep/libmpq
make clean
. ./autogen.sh
if [ "$PLATFORM" != "build" ]; then
    if [ "$PLATFORM" == "i686" ]; then
        mingw32-configure --host=$PLATFORM-w64-mingw32
    else
        mingw64-configure --host=$PLATFORM-w64-mingw32
    fi
else
    ./configure
fi
make
make install
cd ../..
################################################################################################
# Make extractor
cd contrib/vmap_extractor_v3
make clean
if [ ! -d ./$PLATFORM ]; then
    mkdir $PLATFORM
fi;
cd $PLATFORM

if [ "$PLATFORM" != "build" ]; then
    cmake -DCMAKE_TOOLCHAIN_FILE=../../../cmake/mingw32-$PLATFORM.cmake ..
else
    cmake ..
fi

make

if [ "$PLATFORM" != "build" ]; then
    cp ./vmapextract/vmapExtractor3.exe ../../../$BINARY_PATH/$PLATFORM/
    cp /usr/$PLATFORM-w64-mingw32/sys-root/mingw/bin/libbz2-1.dll ../../../$BINARY_PATH/$PLATFORM/
else
    cp ./vmapextract/vmapExtractor3 ../../../$BINARY_PATH/$PLATFORM/
fi
cd ../../..
################################################################################################
# Make external ACE (need run only after ACE version on build server change)
#if [ "$PLATFORM" != "build" ]; then
#    build_prefix="/usr/local/src"
#    ACE_ROOT=$build_prefix/ACE_wrappers; export ACE_ROOT
#    MINGW_BASE=/usr/$PLATFORM-w64-mingw32; export MINGW_BASE
#    export PATH=$MINGW_BASE/bin:$PATH
#    CROSS_COMPILE=$PLATFORM-; export CROSS_COMPILE
#fi
#cd $ACE_ROOT
#echo '#include "ace/config-win32.h"' > $ACE_ROOT/ace/config.h
#echo 'include $(ACE_ROOT)/include/makeinclude/platform_mingw32.GNU' > $ACE_ROOT/include/makeinclude/platform_macros.GNU
#mingw32-make ACE TP_Reactor
#mingw32-make install ACE TP_Reactor
################################################################################################
# Make vmap assembler
cd contrib/vmap_assembler
if [ ! -d ./$PLATFORM ]; then
    mkdir $PLATFORM
fi;
cd $PLATFORM
if [ "$PLATFORM" != "build" ]; then
    cmake -DCMAKE_TOOLCHAIN_FILE=../../../cmake/mingw32-$PLATFORM.cmake ..
else
    cmake ..
fi

make

if [ "$PLATFORM" != "build" ]; then
    cp ./vmap_assembler.exe ../../../$BINARY_PATH/$PLATFORM/
    cp /usr/$PLATFORM-w64-mingw32/sys-root/mingw/lib/libACE.dll ../../../$BINARY_PATH/$PLATFORM/
else
    cp ./vmap_assembler ../../../$BINARY_PATH/$PLATFORM/
fi
cd ../../..
################################################################################################
# Make mmap extractor
cd contrib/mmap
if [ ! -d ./$PLATFORM ]; then
    mkdir $PLATFORM
fi;
cd $PLATFORM
if [ "$PLATFORM" != "build" ]; then
    cmake -DCMAKE_TOOLCHAIN_FILE=../../../cmake/mingw32-$PLATFORM.cmake ..
else
    cmake ..
fi

make

if [ "$PLATFORM" != "build" ]; then
    cp ./MoveMapGen.exe ../../../$BINARY_PATH/$PLATFORM/
else
    cp ./MoveMapGen  ../../../$BINARY_PATH/$PLATFORM/
fi
################################################################################################
