#!/bin/bash
set -e

function main() {
    if usesBoolean "${INPUT_ACTION_DEBUG}"; then
        set -x
    fi
    if ! uses "${INPUT_ROOT}" && ! uses "${INPUT_CONFIG}"; then
        echo "Need either root or config file"
        echo ::set-output name=result::"no config file or root path given"
        exit 1
    fi
    echo "Running Validator"

    BuildARGS=''

    if uses "${INPUT_FORMAT}"; then
        BuildARGS+="--format ${INPUT_FORMAT}"
    fi

    if uses "${INPUT_IGNORE}"; then
        BuildARGS+=" --blacklist ${INPUT_IGNORE}"
    fi

    if usesBoolean "${INPUT_CSS}"; then
        BuildARGS+=" --also-check-css"
    fi

    if uses "${INPUT_CONFIG}"; then
        html5validator --config "${INPUT_CONFIG}" |& tee log.log
        result=${PIPESTATUS[0]}
    else
        html5validator --root "${INPUT_ROOT}" --log "${INPUT_LOG_LEVEL}" ${BuildARGS} ${INPUT_EXTRA} |& tee log.log
        result=${PIPESTATUS[0]}
    fi

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
