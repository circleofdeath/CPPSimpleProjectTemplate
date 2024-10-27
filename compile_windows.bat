@echo off
setlocal enabledelayedexpansion

set "BUILD_DIR=build"
set "RELEASE_DIR=release"

:build
set "platform=%~1"
mkdir "%BUILD_DIR%\%platform%"
cd "%BUILD_DIR%\%platform%"

if "%platform%"=="windows" (
    call cmake -DCMAKE_BUILD_TYPE=Release ^
                -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc ^
                -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ ^
                -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=..\%RELEASE_DIR% ^
                ..\..
) else (
    call cmake -DCMAKE_BUILD_TYPE=Release ^
                -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=..\%RELEASE_DIR% ^
                ..\..
)

call make
cd ..\..

exit /b

if exist "%BUILD_DIR%" (
    rmdir /s /q "%BUILD_DIR%"
)

mkdir "%BUILD_DIR%"
cd "%BUILD_DIR%"

call :build linux
call :build windows

echo Build completed!