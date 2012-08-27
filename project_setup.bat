@ECHO off
REM *****************************************************************************************
REM Set your compiler and another features here. Possible VC1, VC11 
REM currently possible VC10 (MS Visual studio 10 Pro) and VC11 (MS Visual studio 11 or 2012 Pro/Ultimate)
REM Warning! VS Express edition not supported! Also need check path (below) to VC10/11 binary
SET compiler=VC11
REM Install path for MaNGOS (in this be created ./bin and ./etc folders)
SET INSTALL_PATH="C:\\GAMES\\MaNGOS"
rem Platform for build. Possible Win32, Win64. Warning! Win64 build possible only on 64-bit main OS!
SET BUILD_PLATFORM=Win32
rem Count of cores on PC, where project compiled. for speedup only
SET CORE_NUMBER=1
rem Used mangos memory manager. Possible managers - STD, TBB (not recommended), FASTMM (default)
SET MEMORY_MANAGER=FASTMM
REM *****************************************************************************************
if %compiler%==VC11 goto :vc11
if %compiler%==VC10 goto :vc10
goto :help
REM *****************************************************************************************
:vc11
SET COMPILER="Visual Studio 11"
if %BUILD_PLATFORM%==Win64 (SET COMPILER="Visual Studio 11 Win64")
SET COMPILER_PATH="C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/bin/cl.exe"
SET LINKER_PATH="C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/bin/link.exe"
SET VC_VARS="C:\\Program Files (x86)\\Microsoft Visual Studio 11.0\\VC\\"
goto :common
REM *****************************************************************************************
:vc10
SET COMPILER="Visual Studio 10"                                    
if %BUILD_PLATFORM%==Win64 (SET COMPILER="Visual Studio 10 Win64")
SET COMPILER_PATH="C:/Program Files/Microsoft Visual Studio 10.0/VC/bin/cl.exe"
SET LINKER_PATH="C:/Program Files/Microsoft Visual Studio 10.0/VC/bin/link.exe"
SET VC_VARS="C:\\Program Files\\Microsoft Visual Studio 10.0\\VC\\"
goto :common
REM *****************************************************************************************
:help
echo "Set up parameters in this bat file!"
exit
REM *****************************************************************************************
:common
SET RESULT_CONF=Release
SET MEMMAN_STR1="0"
SET MEMMAN_STR3="0"
SET MEMMAN_STR2="0"
if %MEMORY_MANAGER%==STD    (SET MEMMAN_STR2="1")
if %MEMORY_MANAGER%==TBB    (SET MEMMAN_STR3="1")
if %MEMORY_MANAGER%==FASTMM (SET MEMMAN_STR1="1")
SET C_FLAGS="/DWIN32 /D_WINDOWS /W3 /Zm1000 /EHsc /GR"
goto :begin
REM *****************************************************************************************

:begin
if not exist build (
    mkdir build
)

if not exist %INSTALL_PATH% (
mkdir %INSTALL_PATH%
    if not exist %INSTALL_PATH% (
    echo Please, make output directory %INSTALL_PATH%
    exit
    )
)

if %BUILD_PLATFORM%==Win32 goto :win32
if %BUILD_PLATFORM%==Win64 goto :win64
goto :help

REM *****************************************************************************************
:win32
cd build
cmake -G %COMPILER% -DPCH=1 -DCMAKE_CXX_COMPILER=%COMPILER_PATH% -DCMAKE_CXX_FLAGS=%C_FLAGS% -DCMAKE_C_FLAGS=%C_FLAGS% -DCMAKE_CXX_COMPILER=%COMPILER_PATH% -DCMAKE_INSTALL_PREFIX=%INSTALL_PATH% -DUSE_FASTMM_MALLOC=%MEMMAN_STR1% -DUSE_STD_MALLOC=%MEMMAN_STR2% -DUSE_TBB_MALLOC=%MEMMAN_STR3% ..
call %VC_VARS%vcvarsall.bat
MSBuild INSTALL.vcxproj /m:%CORE_NUMBER% /t:Rebuild /p:Configuration=%RESULT_CONF%;Platform=%BUILD_PLATFORM%
goto :end
REM *****************************************************************************************
:win64
cd build
cmake -G %COMPILER% -DPCH=1 -DPLATFORM=X64 -DCMAKE_CXX_FLAGS=%C_FLAGS% -DCMAKE_C_FLAGS=%C_FLAGS% -DCMAKE_CXX_COMPILER=%COMPILER_PATH% -DCMAKE_CXX_COMPILER=%COMPILER_PATH% -DCMAKE_INSTALL_PREFIX=%INSTALL_PATH% -DUSE_FASTMM_MALLOC=%MEMMAN_STR1% -DUSE_STD_MALLOC=%MEMMAN_STR2% -DUSE_TBB_MALLOC=%MEMMAN_STR3% ..
call %VC_VARS%vcvarsall.bat
MSBuild INSTALL.vcxproj /m:%CORE_NUMBER%  /t:Rebuild /p:Configuration=%RESULT_CONF%;Platform=x64
goto :end
REM *****************************************************************************************

:end
cd ..
