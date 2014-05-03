#!/bin/sh

koshu-inout.sh -o A.md od -ta abc

grep -v "^bbb" A.md | sed 's/^ddd/dd/' > B.md
mv B.md A.md

koshu-inout.sh -d -o A.md od -ta abc

if [ $? = 2 ]; then
    exit 0
else
    exit 2
fi

