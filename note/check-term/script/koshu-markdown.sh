#!/bin/sh
#
#  DESCRIPTION
#    Generate markdown document for koshu scripts.
#
#  USAGE
#    koshu-markdown.sh *.k > README.md
#

error () {
    echo "$*" 1>&2
}

subhead () {
    echo
    echo
    echo
    echo "## [$1]($1)"
    echo
}

contents () {
    for k in "$@"; do
        echo "- koshu [$k]`link $k`"
    done
}

link () {
    echo "(#$1)" | tr -d '.'
}

io () {
    input "$1"
    koshu "$1" > $tmp
    output $? "$1"
}

input () {
    subhead "$1"
    list    "$1"
}

list () {
    echo '```'
    tr -d '\r' < "$1"
    echo '```'
}

output () {
    error "[$1] koshu $2"

    if [ "$1" = 0 ]; then
        echo "Command \`koshu $2\` produces:"
    else
        echo "Command \`koshu $2\` exits at $1 and produces:"
    fi

    echo
    echo '```'
    cat $tmp
    echo '```'
}

# --------------------------------------------

tmp=`mktemp TEMPORARY-XXXXXXXX`

echo "# Koshu I/O Listing"
echo

contents "$@"

for k in "$@"; do
    io "$k"
done

if [ -f $tmp ]; then
    rm $tmp
fi

