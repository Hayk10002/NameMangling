# NameMangling

## Table of Contents
- [Introduction](#introduction)
- [Build and Run](#build-and-run)
- [Possible Output](#possible-output)
- [How does this work](#how-does-this-work)

This project shows how different compilers mangle a function name

## Build and Run
To clone and run this project, you'll need [Git](https://git-scm.com) and [CMake](https://cmake.org/) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/Hayk10002/NameMangling

# Go into the repository
$ cd NameMangling

# Run a script to get the mangled name of the function
# for Windows
$ build_and_run.bat

# for Linux
$ chmod +x build_and_run.sh
$ build_and_run.sh

# the last line of the output will contain the mangled name of the function
```

## Possible Output
(On Windows with MSVC compiler)
```
009 00000000 SECT3  notype ()    External     | ?myFunction@@YAHHN@Z (int __cdecl myFunction(int,double))
```
**?myFunction@@YAHHN@Z**

## How does this work
The program compiles a small cpp file, then using tools `dumpbin` for windows and `nm` for linux extracts the mangled name of the function.
