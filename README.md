## OS X build environment for SLADE

### About
This repository contains all third-party libraries required to build [SLADE](http://slade.mancubus.net/) Doom Editor on OS X.  
**NOTE:** If you are using [Homebrew](http://brew.sh/), there is [a better way](https://github.com/alexey-lysiuk/homebrew-slade/blob/master/README.md) to get **SLADE**.

### Requirements
* Intel Mac with 64-bit CPU
* OS X 10.6 Snow Leopard or newer
* Xcode 3.2 or newer
* Git (installed with the recent versions of Xcode)
* [CMake](http://www.cmake.org/) 2.8 or newer (for CMake-based method only)

### How to build
There are two methods of building **SLADE**:

1. _Using provided Xcode project:_  
Execute `xcode.sh` script to clone the main repository and to start Xcode with the corresponding project opened. Now you can compile and debug **SLADE** like any other OS X application.  
The downside of this method is it may fail if source files were added or removed from the main **SLADE** repository. In this case, use the CMake-based method.
2. _Using CMake:_  
Execute `build.sh` script to clone the main repository and to build **SLADE**. The application bundle is located inside `build` directory.
