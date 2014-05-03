#!/bin/sh

add_temp () {
    for opt in $*; do
        if [ "$opt" = -d ]; then
            return
        fi
    done
    mktemp TEMP-KOSHU-XXXX > /dev/null
}

[ $? = 0 ] && add_temp $* && koshu-inout.sh $* -o A.md -t ./temp.sh
[ $? = 0 ] && add_temp $* &&koshu-inout.sh $* -o B.md -t ./temp.sh
[ $? = 0 ] && add_temp $* &&koshu-inout.sh $* -o C.md -t ./temp.sh

rm TEMP-KOSHU-*
