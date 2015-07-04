#!/bin/sh

cd "`dirname \"$0\"`"

if [ ! -e SLADE ]; then
	git clone https://github.com/sirjuddington/SLADE.git
fi

open SLADE.xcodeproj
