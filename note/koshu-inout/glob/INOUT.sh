#!/bin/sh
[ $? = 0 ] && koshu-inout.sh $* -o OD.md od alphabet.txt
[ $? = 0 ] && koshu-inout.sh $* -o KOSHU.md -g od -ta
[ $? = 0 ] && koshu-inout.sh $* -o TEXT.md -x txt -g od -ta
