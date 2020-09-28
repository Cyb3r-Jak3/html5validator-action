#!/bin/bash
if "${{ steps.valid.outputs.result }}" -ne 0; then
    echo "Valid step failed"
    exit 1
fi
if "${{ steps.config.outputs.result }}" -ne 0; then 
    echo "Config step failed"
    exit 1
fi
if "${{ steps.invalid.outputs.result }}" -ne "1"; then 
    echo "Invalid Test failed"
    exit 1;
fi
if "${{ steps.empty.outputs.result }}" -ne "no config file or root path given"; then
 echo "Empty check failed"
 exit 1; 
fi