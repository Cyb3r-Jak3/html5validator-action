#!/bin/sh -l
set -e

echo `html5validator "${INPUT_ROOT}"`

echo ::set-output name=result::"Completed"