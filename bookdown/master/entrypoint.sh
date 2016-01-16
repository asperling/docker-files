#!/bin/bash
set -e

PROJECT_ROOT=/app
MAIN_TOC="${PROJECT_ROOT}/$@"
OUTPUT_DIR="$( dirname $MAIN_TOC )/html"
TPL_CMD="--template=${TEMPLATES_PATH}/main.php"

rm -rf "$OUTPUT_DIR/_images"

IMAGES=$( find ${PROJECT_ROOT} -type f \( -name *.png -o -name *.jpg \) -path */book/* 2> /dev/null )
for IMAGE in $IMAGES; do
  image_dir=${IMAGE%/*}
  image_base=${image_dir##*/}
  IMAGE_TARGET_DIR="${OUTPUT_DIR}/_images/${image_base}"
  mkdir -p ${IMAGE_TARGET_DIR}
  echo "Copy ${IMAGE} to ${IMAGE_TARGET_DIR}/"
  cp ${IMAGE} "${IMAGE_TARGET_DIR}/"
done

ls -la /usr/local/bookdown

set -- /usr/local/bookdown/vendor/bin/bookdown "$@" $TPL_CMD

exec "$@"
