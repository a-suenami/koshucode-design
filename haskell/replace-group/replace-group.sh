#!/bin/sh
runhaskell replace-group.hs <<EOF
abc (xyz) def [xyz] gh
abc (x (y) [z]) def
abc (x (y [z]) def
abc (x (y z]) def
-abc <t>xyz</t> def
EOF
