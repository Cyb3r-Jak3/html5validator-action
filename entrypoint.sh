#!/bin/bash
set -e

function main() {
    echo "Running Validator"

    if usesBoolean "${INPUT_ACTION_DEBUG}"; then
        set -x
    fi

    BuildARGS=""

    if uses "${INPUT_FORMAT}"; then
        BuildARGS+="--format ${INPUT_FORMAT}"
    fi


    html5validator "${INPUT_EXTRA} ${BuildARGS}" --log "${INPUT_LOG_LEVEL}" --root "${INPUT_ROOT}"
    result=$?

    echo ::set-output name=result::$result;
}

function uses() {
    [ -n "${1}" ]
}

function usesBoolean() {
  [ -n "${1}" ] && [ "${1}" = "true" ]
}

main
