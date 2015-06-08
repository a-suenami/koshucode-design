#!/bin/sh
./abc.sh $1 | koshu -i +RTS -s 2>&1 | tail -22
