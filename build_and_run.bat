@echo off
REM Forward all arguments to cmake commands

REM Configure build directory
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug %*

if errorlevel 1 (
  echo Configuring failed.
  exit /b 1
)

echo Configured successfully.

REM Build the project
cmake --build build --config Debug %*

if errorlevel 1 (
  echo Build failed.
  exit /b 1
)

echo Build completed successfully.

REM Run OS-specific commands (Windows)
echo Detected Windows OS.

REM Adjust path and function name as needed
dumpbin /symbols .\build\main.dir\Debug\main.obj | findstr /l "myFunction(int,double)"

exit