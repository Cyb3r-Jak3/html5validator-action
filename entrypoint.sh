#!/bin/bash
set -e

function main() {
    echo "Running Validator"

    if usesBoolean "${INPUT_ACTION_DEBUG}"; then
        set -x
        echo "${INPUT_CONFIG}"
    fi

    BuildARGS=''

    if uses "${INPUT_FORMAT}"; then
        BuildARGS+="--format ${INPUT_FORMAT}"
    fi

    if usesBoolean "${INPUT_CSS}"; then
        BuildARGS+=" --also-check-css"
    fi

    if uses "${INPUT_CONFIG}"; then
        echo "Using Config File"
        html5validator --config "${INPUT_CONFIG}" |& tee log.log
    else
    echo "Not using Config File"
        html5validator --root "${INPUT_ROOT}" --log "${INPUT_LOG_LEVEL}" ${BuildARGS} "${INPUT_EXTRA}" |& tee log.log
    fi
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
