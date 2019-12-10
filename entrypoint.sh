#!/bin/sh -l
set -e

html5validator "${INPUT_ROOT}"

echo ::set-output name=result::"Completed"