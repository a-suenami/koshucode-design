#!/bin/sh

cat <<EOF | koshu-syntax -ib
|-- P  /x 0
       /y 1
|== Q : source P /x /y
EOF
