#!/bin/bash

set -e

PROJECT_ROOT=/app

if [ -z "$@" ]; then
  echo "Missing param. You should provide a path to the main bookdown file"
  exit 1
fi

if [ ! -f "${PROJECT_ROOT}/$@" ]; then
  echo "Main bookdown file $@ not found"
  exit 1
fi

if [ ! -d ${TEMPLATES_PATH} ];  then
  echo "No templates found! Did you forget to mount /templates?"
  exit 1
fi

TEMPLATE_PARAMETER="--template=${TEMPLATES_PATH}/main.php"
MAIN_BOOKDOWN="$@"

function generate() {
  /root/composer/vendor/bin/bookdown ${MAIN_BOOKDOWN} ${TEMPLATE_PARAMETER}
}

generate

php -S 0.0.0.0:8080 -t /app/docs/html &

# Initialize a checksum
CHECKSUM1=`find ${TEMPLATES_PATH} -type f -exec md5sum {} \;`

while [[ true ]]
do
    # Create checksum of all files except HTML files
    CHECKSUM2=`find ${TEMPLATES_PATH} -type f -exec md5sum {} \;`
    if [[ $CHECKSUM1 != $CHECKSUM2 ]] ; then
        generate
        CHECKSUM1=$CHECKSUM2
    fi
    sleep 2
done
