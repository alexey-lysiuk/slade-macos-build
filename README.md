## macOS build environment for SLADE

### About
This repository contains all third-party libraries required to build [SLADE](http://slade.mancubus.net/) Doom Editor on macOS.  
**NOTE:** If you are using [Homebrew](http://brew.sh/), there is [a better way](https://github.com/alexey-lysiuk/homebrew-slade/blob/master/README.md) to get **SLADE**.

### Requirements
* Intel Mac with 64-bit CPU
* macOS 10.7 Lion or newer
* [Xcode](https://developer.apple.com/xcode/) 4.6 or newer
* [Git](https://git-scm.com/) (installed with the recent versions of Xcode)
* [CMake](https://www.cmake.org/) 2.8 or newer

### How to build
There are two methods of building **SLADE**:

1. _From Xcode:_  
Execute `xcode.sh` script to start Xcode with the project opened. Now you can compile and debug **SLADE** like any other macOS application.
2. _From command line:_  
Execute `build.sh` script to build **SLADE**. The application bundle will be created inside `build/Release` directory.

In both cases the main repository is cloned into **SLADE** directory. This happened only once during the first run of the script. You will need to pull changes by hand after that.

It's possible to create a Disk Image `*.dmg` file, suitable for making redistributable builds. Execute `make_dmg.sh` script to generate it.

You can build and create a Disk Image at an arbitrary Git tag by specifying its name as a command line parameter for `xcode.sh` and `make_dmg.sh` scripts.
Also, you can switch to a branch other than **master** and run the corresponding script again.
