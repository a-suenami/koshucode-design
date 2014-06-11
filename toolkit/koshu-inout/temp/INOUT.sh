#!/bin/sh

[ $? = 0 ] && koshu-inout.sh $* -o A.md -t ./temp.sh
[ $? = 0 ] && koshu-inout.sh $* -o B.md -t ./temp.sh
[ $? = 0 ] && koshu-inout.sh $* -o C.md -t ./temp.sh
status=$?

rm TEMP-KOSHU-*
exit $status
