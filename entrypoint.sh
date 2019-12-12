#!/bin/sh
set -e

echo "Running Validator"

if "$INPUT_DEBUG_FLAG" == "true"; then
    echo "html5validator  --root $INPUT_ROOT $INPUT_EXTRA"
    echo "Files in input directory $(find $INPUT_ROOT)"
fi


html5validator --root "$INPUT_ROOT"
result=$?

echo ::set-output name=result::$result