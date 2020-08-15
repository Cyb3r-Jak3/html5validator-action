#!/bin/bash
set -e

function main() {
    echo "Running Validator"

    if usesBoolean "${INPUT_ACTION_DEBUG}"; then
        set -x
    fi

    BuildARGS=''

    if uses "${INPUT_FORMAT}"; then
        BuildARGS+="--format ${INPUT_FORMAT}"
    fi

    if usesBoolean "${INPUT_CSS}"; then
        BuildARGS+=" --also-check-css"
    fi

    if uses "${INPUT_EXTRA}"; then
        BuildARGS+=" "${INPUT_EXTRA}
    fi

    html5validator --root "${INPUT_ROOT}" --log "${INPUT_LOG_LEVEL}" ${BuildARGS} |& tee log.log
    result=${PIPESTATUS[0]}

    if usesBoolean "${INPUT_ACTION_DEBUG}"; then
        echo "$result"
    fi

    echo ::set-output name=result::$result;
    exit "$result"
}

function uses() {
    [ -n "${1}" ]
}

function usesBoolean() {
  [ -n "${1}" ] && [ "${1}" = "true" ]
}

main
