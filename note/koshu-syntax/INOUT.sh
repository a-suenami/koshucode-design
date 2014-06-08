#!/bin/sh
koshu-syntax token-table.k > TOKEN.k
koshu-inout.sh $* -s koshu token-table.k TOKEN.k
