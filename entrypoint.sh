#!/bin/sh
set -e

echo "Running Validator"

if "$INPUT_DEBUG_FLAG" == "true"; then
    echo "html5validator  --root $INPUT_ROOT $INPUT_EXTRA"
    ls "$INPUT_ROOT"
fi


html5validator  --root "$INPUT_ROOT" "$INPUT_EXTRA"
result=$?

echo ::set-output name=result::$result