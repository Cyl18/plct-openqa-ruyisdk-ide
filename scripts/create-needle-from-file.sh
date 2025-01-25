#!/bin/bash
set -e
export DISPLAY=:1

base_image=$1
json_name="${base_image%.*}.json"

flatpak run io.github.lruzicka.Needly $base_image
#read -p "enter filename without extension: " filename
filename=$(jq -r '.tags[0]' $json_name)
mv $base_image products/plct-openqa-ruyisdk-ide/needles/$filename.png
mv $json_name products/plct-openqa-ruyisdk-ide/needles/$filename.json
echo "Needle saved to products/plct-openqa-ruyisdk-ide/needles/$filename.png"
