#!/bin/sh
set -e

echo "Running Validator"
echo ""
cmd `html5validator "$INPUT_ROOT"`
html5validator "$INPUT_ROOT" > output.txt

echo ::set-output name=result::"$(cat output.txt && echo "${INPUT_ROOT}" )"