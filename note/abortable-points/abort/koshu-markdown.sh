#!/bin/sh
#
#  DESCRIPTION
#    Generate markdown document for koshu scripts.
#
#  USAGE
#    koshu-markdown.sh *.k > README.md
#

echo "# Koshu I/O Listing"

for k in "$@"; do
    echo
    echo "## $k"
    echo

    echo "Input"
    echo
    echo '```'
    tr -d '\r' < "$k"
    echo '```'

    echo "Output"
    echo
    echo '```'
    koshu "$k"
    echo '```'
done

