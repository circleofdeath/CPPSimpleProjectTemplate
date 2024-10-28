@echo off
setlocal enabledelayedexpansion

set "BUILD_DIR=build"
set "RELEASE_DIR=release"

if exist "%BUILD_DIR%" (
    rmdir /s /q "%BUILD_DIR%"
)

mkdir "%BUILD_DIR%"
cd "%BUILD_DIR%"

:build_windows
echo Building for Windows...
mkdir "windows"
cd "windows"
cmake -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=..\%RELEASE_DIR% ^
      -G "MinGW Makefiles" ^
      ..\..
if errorlevel 1 (
    echo "CMake configuration failed for Windows."
    exit /b 1
)
echo Running make...
make
cd ..

:build_linux
echo Building for Linux...
mkdir "linux"
cd "linux"
cmake -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=..\%RELEASE_DIR% ^
      -G "Unix Makefiles" ^
      ..\..
if errorlevel 1 (
    echo "CMake configuration failed for Linux."
    exit /b 1
)
echo Running make...
make
cd ..

cd ..
exit /b

call :build_windows
call :build_linux

echo Build completed!
