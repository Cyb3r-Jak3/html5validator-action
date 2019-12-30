#!/bin/bash
set -e

function main() {
    echo "Running Validator"

    BuildARGS=''

    if uses "${INPUT_FORMAT}"; then
        BuildARGS+="--format ${INPUT_FORMAT}"
    fi

    if uses "${INPUT_EXTRA}"; then
        BuildARGS+=" ${INPUT_EXTRA}"
    fi

    if usesBoolean "${INPUT_ACTION_DEBUG}"; then
        set -x
    fi

    html5validator --root "${INPUT_ROOT}" --log "${INPUT_LOG_LEVEL}" ${BuildARGS} > output
    result=$?
    output=$(cat output)

    echo ::set-output name=result::$result;
    echo ::set-output name=log::$output;
}

function uses() {
    [ -n "${1}" ]
}

function usesBoolean() {
  [ -n "${1}" ] && [ "${1}" = "true" ]
}

main
