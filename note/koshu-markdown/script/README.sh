#!/bin/sh
koshu-markdown.sh -o A.md         calc.k A.k
koshu-markdown.sh -r           -g calc.k
koshu-markdown.sh -o ARGS.md   -f ARGS calc.k
