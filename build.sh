#!/bin/sh

set -o errexit

cd "`dirname \"$0\"`"
./prepare.sh "$1"

cd build
xcodebuild -configuration Release
