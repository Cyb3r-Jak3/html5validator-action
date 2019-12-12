#!/bin/sh
set -e

echo "Running Validator"
echo ""

html5validator "$@" --root "$INPUT_ROOT"
result=$?

echo ::set-output name=result::$result