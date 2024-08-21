#!/bin/bash

image_name_prefix="wjtje/development"

# This will build all the images
# Each image MUST have the following nameing format 00-name
# An image can depend on an image that is a lower number, but not a higher number

for p in ./image/*; do
    image_name=$(echo $p | cut -d - -f 2-)
    image_version=$(cat "$p/VERSION")
    echo "Building image: $image_name with version: $image_version"
    docker build . --no-cache -f "$p/Dockerfile" -t "$image_name_prefix/$image_name:$image_version"
done
