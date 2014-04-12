#!/bin/sh
[ $? = 0 ] && koshu-inout.sh $* -o A.md         calc.k A.k
[ $? = 0 ] && koshu-inout.sh $* -r           -g calc.k
[ $? = 0 ] && koshu-inout.sh $* -o ARGS.md   -f ARGS calc.k
