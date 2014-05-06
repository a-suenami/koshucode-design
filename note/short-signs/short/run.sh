#!/bin/sh
#
#  DESCRIPTION
#    Run "short-simple" and "short-tree"
#
#  USAGE
#    ./run.sh
#

abc    () { ./times.hs 5000 < data/ABC.txt ;}
simple () { dist/build/short-simple/short-simple "$@" ;}
tree   () { dist/build/short-tree/short-tree     "$@" ;}

echo "---------------------- simple"
simple < data/WORD.txt

echo "---------------------- tree"
tree < data/WORD.txt

echo "---------------------- performance"
abc | simple +RTS -p | wc
abc | tree   +RTS -p | wc
grep total.time *.prof

