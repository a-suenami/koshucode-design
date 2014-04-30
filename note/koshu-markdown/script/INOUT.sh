#!/bin/sh
[ $? = 0 ] && koshu-inout.sh $* -o A.md         koshu calc.k A.k
[ $? = 0 ] && koshu-inout.sh $* -r           -g koshu calc.k
[ $? = 0 ] && koshu-inout.sh $* -o ARGS.md   -f ARGS koshu calc.k
