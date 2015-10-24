#!/bin/sh

set -o errexit

cd "`dirname \"$0\"`"
./prepare.sh "$1"

cd build
open slade3.xcodeproj
