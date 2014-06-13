#!/bin/sh
koshu-change B.k -t A.k > C.k
koshu-inout.sh $* -s -f COMMAND koshu-change
