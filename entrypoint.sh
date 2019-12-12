#!/bin/sh
set -e

echo "Running Validator"
echo ""
html5validator --log DEBUG --root "$INPUT_ROOT" > output.txt

echo ::set-output name=result::"$(cat output.txt)"