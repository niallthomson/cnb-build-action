#!/bin/sh

set -e

args=""

if [ "${INPUT_PUBLISH}" == "true" ]; then
  args="$args --publish"
fi

if [ "${INPUT_SNAPSHOT}" == "true" ]; then
  timestamp=`date +%Y%m%d%H%M%S`
  shortSha=$(echo "${GITHUB_SHA}" | cut -c1-6)
  sha_tag="${timestamp}${shortSha}"

  INPUT_IMAGENAME="$INPUT_IMAGENAME:$sha_tag"
fi

if [ -n "${INPUT_REGISTRY}" ]; then
  echo ${INPUT_REGISTRYPASSWORD} | docker login -u ${INPUT_REGISTRYUSERNAME} --password-stdin ${INPUT_REGISTRY}
fi

pack build $INPUT_IMAGENAME -p /github/workspace/$INPUT_PATH --builder $INPUT_BUILDER $args

echo "::set-output name=imageName::$INPUT_IMAGENAME"