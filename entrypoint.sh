#!/bin/sh

set -e

path=$1
imageName=$2
builder=$3
publish=$4

args=""

if [ -n "${publish}" ]; then
  args="$args --publish"
fi

pack build $imageName -p /github/workspace/$path --builder $builder $args

echo "::set-output name=imageName::$imageName"