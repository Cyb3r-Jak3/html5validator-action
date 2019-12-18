#!/bin/sh
set -x

echo "Running Validator"

if "$INPUT_DEBUG_FLAG" == "true"; then
    echo "html5validator  --root ${INPUT_ROOT} ${INPUT_EXTRA}"
    echo "Files in input directory $(find ${INPUT_ROOT})"
fi

# For some reason adding the input extra causes it to error out
html5validator --root "${INPUT_ROOT} ${INPUT_EXTRA}"
result=$?
extra=${INPUT_EXTRA}
html5validator "$extra" --root "${INPUT_ROOT}"

echo ::set-output name=result::$result