#!/bin/sh
#
#  List abortable tags
#


# * * * *   Directory

ab_cd () {
    ab_ghci=`which koshu-ghci.sh`
    ab_dir=`dirname $ab_ghci`
    ab_baala=$ab_dir/koshucode-master/baala

    if [ -d $ab_baala ]; then
        cd $ab_baala
    else
        echo "ERROR : koshucode-master directory is not found"
        exit 2
    fi
}


# * * * *   List

ab_list_all () {
    ab_list_in base
    ab_list_in core
    ab_list_in operator
}

ab_list_in () {(
    cd $1
    ab_list_for $1
)}

ab_list_for () {
    for ab_hs in `find Koshucode -name '[A-Z]*.hs'`; do
        ab_dir=`dirname $ab_hs`
        ab_base=`basename $ab_hs`

        if grep -q B.abortable $ab_hs; then
            cat -n $ab_hs | sed -n \
                's:^ *\([0-9]*\).*B.abortable.*"\([a-z]*\)".*:\2 \1 '"$ab_base $ab_dir $1"':p'
        fi
    done
}


# * * * *   Koshu

ab_koshu () {
    ab_data
    ab_script
}

ab_data () {
    while read ab_tag ab_line ab_file ab_dir ab_pkg; do
        echo "|-- ABORTABLE /tag '$ab_tag /pkg '$ab_pkg /line $ab_line /file \"$ab_file\" /dir \"$ab_dir\""
    done
}

ab_script () {
    cat <<EOF
|== ABORTABLE -with-table
  : source ABORTABLE /tag /pkg /dir /file /line
EOF
}


# * * * *   Main

ab_cd

ab_list_all | sort | ab_koshu | koshu -i

