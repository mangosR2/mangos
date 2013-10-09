@ECHO off
COLOR 0B
REM *****************************************************************************************
REM Set your compiler and another features here. Possible VC1, VC11 
REM currently possible VC10 (MS Visual studio 10 Pro) and VC11 (MS Visual studio 11 or 2012 Pro/Ultimate)
REM Warning! VS Express edition not supported! Also need check path (below) to VC10/11 binary
SET vs=Visual studio 11

REM Install path for MaNGOS (in this be created ./bin and ./etc folders)
SET INSTALL_PATH="C:\\MaNGOS"

REM Platform for build. Possible Win32, Win64. Warning! Win64 build possible only on 64-bit main OS!
SET BUILD_PLATFORM=Win32

REM Count of cores on PC, where project compiled. for speedup only
SET CORE_NUMBER=2

REM Used mangos memory manager. Possible managers - STD, TBB (not recommended), FASTMM (default)
SET MEMORY_MANAGER=FASTMM

SET vs_path=%ProgramFiles(x86)%

IF "%vs_path%"=="" (
    SET "vs_path=%ProgramFiles%"
)
SET vs_path=%vs_path:\=/%

:menu
REM *****************************************************************************************
if "%vs%"=="Visual studio 11" (
    SET COMPILER="Visual Studio 11"
    if %BUILD_PLATFORM%==x64 (SET COMPILER="Visual Studio 11 Win64")
    SET COMPILER_PATH="%vs_path%/Microsoft Visual Studio 11.0/VC/bin/cl.exe"
    SET LINKER_PATH="%vs_path%/Microsoft Visual Studio 11.0/VC/bin/link.exe"
    SET VC_VARS="%vs_path%\\Microsoft Visual Studio 11.0\\VC\\"
)
if "%vs%"=="Visual studio 10" (
    SET COMPILER="Visual Studio 10"
    if %BUILD_PLATFORM%==x64 (SET COMPILER="Visual Studio 10 Win64")
    SET COMPILER_PATH="%vs_path%/Microsoft Visual Studio 10.0/VC/bin/cl.exe"
    SET LINKER_PATH="%vs_path%/Microsoft Visual Studio 10.0/VC/bin/link.exe"
    SET VC_VARS="%vs_path%\\Microsoft Visual Studio 10.0\\VC\\"
)

SET RESULT_CONF=Release
SET MEMMAN_STR1="0"
SET MEMMAN_STR3="0"
SET MEMMAN_STR2="0"
if %MEMORY_MANAGER%==STD    (SET MEMMAN_STR2="1")
if %MEMORY_MANAGER%==TBB    (SET MEMMAN_STR3="1")
if %MEMORY_MANAGER%==FASTMM (SET MEMMAN_STR1="1")
SET C_FLAGS="/DWIN32 /D_WINDOWS /W3 /Zm1000 /EHsc /GR"
SET CMakeConfiguration=-G %COMPILER% -DPCH=1 -DCMAKE_CXX_COMPILER=%COMPILER_PATH% -DCMAKE_CXX_FLAGS=%C_FLAGS% -DCMAKE_C_FLAGS=%C_FLAGS% -DCMAKE_CXX_COMPILER=%COMPILER_PATH% -DCMAKE_INSTALL_PREFIX=%INSTALL_PATH% -DUSE_FASTMM_MALLOC=%MEMMAN_STR1% -DUSE_STD_MALLOC=%MEMMAN_STR2% -DUSE_TBB_MALLOC=%MEMMAN_STR3% ..
SET MSBuildConfiguration=INSTALL.vcxproj /m:%CORE_NUMBER% /p:Configuration=%RESULT_CONF%;Platform=%BUILD_PLATFORM%
REM *****************************************************************************************

cls
echo ##########################
echo # Welcome to R2 compiler #
echo ##########################
echo.
REM *****************************************************************************************
echo +++++++++++++++++++++ Current CMake configuration +++++++++++++++++++++
echo cmake %CMakeConfiguration%
echo.
echo +++++++++++++++++++++ Current compiler configuration +++++++++++++++++++++
echo MSBuild %MSBuildConfiguration%
REM *****************************************************************************************
echo.
echo.
echo 0 - Exit R2 compiler
echo.
echo 1 - Change compiler            [%vs%]
echo 2 - Change build platform      [%BUILD_PLATFORM%]
echo 3 - Change install path        [%INSTALL_PATH%]
echo 4 - Change CPU core(s) number  [%CORE_NUMBER%]
echo.
echo 5 - Change VS Path             [%vs_path%]
echo.
echo 8 - Create Project
echo 9 - Start compile
echo.
set /P menu=Select a number: 
if "%menu%"=="0" goto end
if "%menu%"=="1" goto compiler
if "%menu%"=="2" goto platform
if "%menu%"=="3" goto path
if "%menu%"=="4" goto core
if "%menu%"=="5" goto win_part
if "%menu%"=="8" goto cmake
if "%menu%"=="9" goto build
if "%menu%"=="%menu%" echo. & echo Wrong number! & pause & goto menu

:compiler
cls
echo 1 - Visual studio 10
echo 2 - Visual studio 11

set /P menu=Select a number: 
if "%menu%"=="1" SET vs=Visual studio 10& goto menu
if "%menu%"=="2" SET vs=Visual studio 11& goto menu
if "%menu%"=="%menu%" echo. & echo Wrong number! & pause & goto compiler

:path
cls
set /P install_drive=Enter the partition drive letter first: 
set /P install_path=Enter the folder name: 
set INSTALL_PATH="%install_drive%:\\%install_path%"
goto menu

:platform
cls
echo 1 - Win32
echo 2 - x64

set /P menu=Select a number: 
if "%menu%"=="1" SET BUILD_PLATFORM=Win32& goto menu
if "%menu%"=="2" SET BUILD_PLATFORM=x64& goto menu
if "%menu%"=="%menu%" echo. & echo Wrong number! & pause & goto platform

:core
cls
set /P CORE_NUMBER=Enter your CPU core number: 
goto menu

:win_part
cls
set /P vs_path=Enter the VS path:
goto menu

:cmake
REM *****************************************************************************************

if not exist build (
    mkdir build
)

if not exist %INSTALL_PATH% (
    mkdir %INSTALL_PATH%
    if not exist %INSTALL_PATH% (
        echo Please, make output directory %INSTALL_PATH%
        pause
        goto :menu
    )
)

cd build
cmake %CMakeConfiguration%
cd ..
pause
goto :menu
REM *****************************************************************************************

:build
call %VC_VARS%vcvarsall.bat
cd build
MSBuild %MSBuildConfiguration%
cd ..
pause
goto :menu
REM *****************************************************************************************

:help
echo "Set up parameters in this bat file!"
goto :menu
REM *****************************************************************************************

:end
