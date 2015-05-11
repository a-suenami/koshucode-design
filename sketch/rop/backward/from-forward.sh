#!/bin/sh
move () { sed 's/forward/backward/g; s/to the front/to the rear/g' ; }
move < ../forward/forward.k > backward.k
move < ../forward/option.k  > option.k
