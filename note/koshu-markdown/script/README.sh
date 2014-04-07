#!/bin/sh
[ $? = 0 ] && koshu-markdown.sh $* -o A.md         calc.k A.k
[ $? = 0 ] && koshu-markdown.sh $* -r           -g calc.k
[ $? = 0 ] && koshu-markdown.sh $* -o ARGS.md   -f ARGS calc.k
