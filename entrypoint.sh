#!/bin/bash
set -ex

echo "Running Validator"

if [[ -n "$INPUT_DEBUG_FLAG" ]]; then
    echo "html5validator  --root ${INPUT_ROOT} ${INPUT_EXTRA}"
    echo "Files in input directory $(find ${INPUT_ROOT})"
fi

# For some reason adding the input extra causes it to error out
html5validator "${INPUT_EXTRA}" --root "${INPUT_ROOT}"
result=$?

echo ::set-output name=result::$result