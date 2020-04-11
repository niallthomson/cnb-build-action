#!/bin/sh

set -e

path=$1
imageName=$2
builder=$3
publish=$4

echo "Executing... $@"

/pack/pack build $imageName -p /github/workspace/$path --builder $builder