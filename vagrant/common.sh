#!/bin/bash

#===  FUNCTION  ================================================================
#         NAME:  version
#  DESCRIPTION:  Convert a version string to integer
# PARAMETER  1:  Version string
#===============================================================================
function version() {
    echo "$@" | awk -F "." '{ printf("%03d%03d\n", $1, $2); }'
}
