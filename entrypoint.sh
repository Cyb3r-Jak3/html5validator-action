#!/bin/sh
set -e

echo "Running Validator"
echo ""
html5validator --log DEBUG "$INPUT_ROOT" > output.txt
cat output

echo ::set-output name=result::"$(cat output.txt && echo "${INPUT_ROOT}" )"