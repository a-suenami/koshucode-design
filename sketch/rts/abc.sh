#!/bin/sh

n=$1

while [ $n -gt 0 ]; do
    echo '|-- ABC  /a /b /c /d /e /f /g /h /i /j /k /l /m /n'
    n=$(( $n - 1 ))
done
