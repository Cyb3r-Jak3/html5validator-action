#!/bin/sh
set -e

echo "Running Validator"
echo "$INPUT_ROOT $INPUT_EXTRA"

html5validator  --root "$INPUT_ROOT" "$INPUT_EXTRA"
result=$?

echo ::set-output name=result::$result