#!/bin/bash
set -e

function main() {
    if usesBoolean "${HTML5_ACTION_DEBUG}"; then
        set -x
        INPUT_LOG_LEVEL=DEBUG
        python --version
        html5validator --version
        git --version
    fi

    # Make sure repo is safe. See #31 for more info. Upstream Issue: https://github.com/actions/checkout/issues/760
    git config --global --add safe.directory /github/workspace

    if ! uses "${INPUT_ROOT}" && ! uses "${INPUT_CONFIG}"; then
        echo ::error::"Need either root or config file"
        echo ::set-output name=result::"no config file or root path given"
        exit 1
    fi
    echo "Running Validator"

    if ! git -C . rev-parse 2>/dev/null && ! usesBoolean "${INPUT_SKIP_GIT_CHECK}"; then
        echo ::set-output name=result::"There is no git respository detected"
        echo ::error::"There is no git respository detected"
        exit 1
    fi

    BuildARGS=''

    if uses "${INPUT_FORMAT}"; then
        BuildARGS+="--format ${INPUT_FORMAT}"
    fi

    if uses "${INPUT_BLACKLIST}"; then
        BuildARGS+=" --blacklist ${INPUT_BLACKLIST}"
    fi

    if usesBoolean "${INPUT_CSS}"; then
        BuildARGS+=" --also-check-css"
    fi

    if uses "${INPUT_CONFIG}"; then
        html5validator --config "${INPUT_CONFIG}" |& tee log.log
        result=${PIPESTATUS[0]}
    else
        if [ "${INPUT_ROOT}" == "" ]; then
            echo ::set-output name=result::"There is no root given"
            echo ::error::"There is no root given"
            exit 1
        fi
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
