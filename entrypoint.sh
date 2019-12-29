#!/bin/bash
set -e

function main() {
    echo "Running Validator"

    html5validator "${INPUT_EXTRA}" --log "${INPUT_LOG_LEVEL}" --format "${INPUT_FORMAT}" --root "${INPUT_ROOT}"
    result=$?

    echo ::set-output name=result::$result;
}

function uses() {
    [ -n "${1}" ]
}

main
