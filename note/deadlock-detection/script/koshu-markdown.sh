#!/bin/sh
#
#  DESCRIPTION
#    Generate markdown document for koshu scripts.
#
#  USAGE
#    koshu-markdown.sh deadlock.k *.k > README.md
#

usage () {
    echo "DESCRIPTION"
    echo "  Generate markdown document for koshu script"
    echo
    echo "USAGE"
    echo "  $0 CALC.k DATA.k ... > README.md"
    echo

    exit 1
}

error () {
    echo "$*" 1>&2
}

subhead () {
    echo
    echo "## [$1]($1)"
    echo
}

contents () {
    echo
    echo "- [$calc]`link $calc`"

    for k in "$@"; do
        if [ "$k" != "$calc" ]; then
            echo "- koshu $calc [$k]`link $k`"
        fi
    done
}

link () {
    echo "(#$1)" | tr -d '.'
}

io () {
    input "$1"
    koshu "$calc" "$1" | output $? "$1"
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
    error "[$1] koshu $calc $2"

    if [ "$1" = 0 ]; then
        echo "Command \`koshu $calc $2\` produces:"
    else
        echo "Command \`koshu $calc $2\` exits at $1 and produces:"
    fi

    echo
    echo '```'
    cat -
    echo '```'
}

# --------------------------------------------

calc="$1"
shift

if [ ! -e "$calc" ]; then
    usage
fi

echo "# Koshu I/O Listing"

contents "$@"

input "$calc"

for k in "$@"; do
    if [ "$k" != "$calc" ]; then
        io "$k"
    fi
done

