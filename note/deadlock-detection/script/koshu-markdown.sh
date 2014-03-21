#!/bin/sh
#
#  DESCRIPTION
#    Generate markdown document for koshu scripts.
#
#  USAGE
#    koshu-markdown.sh *.k > README.md
#

calc=deadlock.k

subhead () {
    echo
    echo "## $1"
    echo
}

list () {
    echo '```'
    tr -d '\r' < "$1"
    echo '```'
}

io () {
    subhead "$1"
    list "$1"

    echo "Command \`koshu $calc $1\` produces:"
    echo
    echo '```'
    koshu "$calc" "$1"
    echo '```'
}

echo "# Koshu I/O Listing"

subhead "$calc"
list "$calc"

for k in "$@"; do
    if [ "$k" != "$calc" ]; then
        io "$k"
    fi
done

