#!/bin/sh -l
set -e

echo ::set-output name=result::`html5validator "${INPUT_FPATH}"`