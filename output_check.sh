#!/bin/bash
if [[ "$VALID_OUT" -ne 0 ]]; then
    echo "Valid step failed"
    exit 1
fi
if [[ "$INVALID_OUT" -ne 2 ]]; then 
    echo "Invalid Test failed"
    exit 1;
fi
if [[ "$CONFIG_OUT" -ne 0 ]]; then 
    echo "Config step failed"
    exit 1
fi
if [[ "$EMPTY_OUT" != "no config file or root path given" ]]; then
 echo "Empty check failed"
 exit 1; 
fi