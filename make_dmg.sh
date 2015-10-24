#!/bin/sh

set -o errexit

cd "`dirname \"$0\"`"
./build.sh "$1"

DEPLOY_DIR=deploy

mkdir "$DEPLOY_DIR"
cp -r build/Release/slade.app "$DEPLOY_DIR/SLADE.app"
cp SLADE/gpl-2.0.txt "$DEPLOY_DIR"
ln -s /Applications "$DEPLOY_DIR/Applications"

cd SLADE
DEPLOY_IMAGE_NAME=SLADE-`git describe --tags`
cd ..

hdiutil create -srcfolder "$DEPLOY_DIR" -volname "$DEPLOY_IMAGE_NAME" \
        -format UDBZ -fs HFS+ -fsargs "-c c=64,a=16,e=16" \
        "$DEPLOY_IMAGE_NAME.dmg"
