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
        BuildARGS+=" ${INPUT_EXTRA}"
    fi

    html5validator --root "${INPUT_ROOT}" --log "${INPUT_LOG_LEVEL}" ${BuildARGS} &> log.log
    log_out=$(cat log.log)
    result=$?

    echo ::set-output name=result::$result;
    echo ::set-output name=log::$log_out;
}

function uses() {
    [ -n "${1}" ]
}

function usesBoolean() {
  [ -n "${1}" ] && [ "${1}" = "true" ]
}

main
