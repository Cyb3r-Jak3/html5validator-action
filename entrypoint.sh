#!/bin/sh -l
set -e

echo "Running Validator"

html5validator "${INPUT_ROOT}" > output.txt

echo ::set-output name=result::`echo output.txt`