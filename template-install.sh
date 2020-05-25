#!/bin/bash

XCODE_TEMPLATE_DIR="$HOME/Library/Developer/Xcode/Templates/File Templates/Design Pattern/"

echo "Installing templates to: $XCODE_TEMPLATE_DIR"

rm -rf "$XCODE_TEMPLATE_DIR"
mkdir -p "$XCODE_TEMPLATE_DIR"
cp -rf Templates/*.xctemplate "$XCODE_TEMPLATE_DIR"

echo "Done"
