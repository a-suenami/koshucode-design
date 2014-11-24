#!/bin/sh

K=koshu-source.k
F=foo.k
B=bar.k

koshu-inout.sh $* -r ./stdin.sh \
&& koshu-inout.sh $* -o permutation/KFB.md koshu $K $F $B \
&& koshu-inout.sh $* -o permutation/KBF.md koshu $K $B $F \
&& koshu-inout.sh $* -o permutation/FKB.md koshu $F $K $B \
&& koshu-inout.sh $* -o permutation/FBK.md koshu $F $B $K \
&& koshu-inout.sh $* -o permutation/BKF.md koshu $B $K $F \
&& koshu-inout.sh $* -o permutation/BFK.md koshu $B $F $K
