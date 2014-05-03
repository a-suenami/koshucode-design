#!/bin/sh
[ $? = 0 ] && koshu-inout.sh $* -s echo INOUT
[ $? = 0 ] && koshu-inout.sh $* -o A.md echo A
[ $? = 0 ] && koshu-inout.sh $* -o B.md ./markdown.sh
