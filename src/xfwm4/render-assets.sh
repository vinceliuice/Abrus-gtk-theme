#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
DARK_SRC_FILE="assets-dark.svg"
LIGHT_SRC_FILE="assets-light.svg"
ASSETS_DIR="assets"
DARK_ASSETS_DIR="assets-dark"
LIGHT_ASSETS_DIR="assets-light"

INDEX="assets.txt"

for i in `cat $INDEX`
do 
if [ -f $LIGHT_ASSETS_DIR/$i.png ]; then
    echo $LIGHT_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $LIGHT_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-png=$LIGHT_ASSETS_DIR/$i.png $LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $LIGHT_ASSETS_DIR/$i.png 
fi

if [ -f $LIGHT_DARK_ASSETS_DIR/$i.png ]; then
    echo $LIGHT_DARK_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $DARK_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-png=$DARK_ASSETS_DIR/$i.png $DARK_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $DARK_ASSETS_DIR/$i.png 
fi
done

cp $DARK_ASSETS_DIR/*.png $ASSETS_DIR/

exit 0
