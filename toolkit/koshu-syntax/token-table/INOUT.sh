#!/bin/sh
koshu-syntax token-table.k > TOKEN.k
koshu-inout.sh $* -r koshu token-table.k TOKEN.k
