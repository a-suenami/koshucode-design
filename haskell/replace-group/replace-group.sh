#!/bin/sh
runhaskell replace-group.hs <<EOF
** Examples of 'shortenGroup'
abc (xyz) def [xyz] gh
abc (x (y) [z]) def
abc (x (y [z]) def
abc (x (y z]) def

** Example of 'deleteTag'
-abc <t>xyz</t> def
EOF
