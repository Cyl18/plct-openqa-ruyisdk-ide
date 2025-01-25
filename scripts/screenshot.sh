#!/bin/bash
set -e
export DISPLAY=:1

gnome-screenshot -f tmp.png -w
convert tmp.png -crop 1024x768+0+37 tmp.png # 
flatpak run io.github.lruzicka.Needly tmp.png
#read -p "enter filename without extension: " filename
filename=$(jq -r '.tags[0]' tmp.json)
mv tmp.png products/plct-openqa-ruyisdk-ide/needles/$filename.png
mv tmp.json products/plct-openqa-ruyisdk-ide/needles/$filename.json
echo "Needle saved to products/plct-openqa-ruyisdk-ide/needles/$filename.png"
