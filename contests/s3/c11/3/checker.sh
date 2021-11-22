#!/bin/bash
$1 $2 $3 $4 $5 $6

new=$6.check.txt

if [ ! -f "$new" ]; then
   del=1
else
   del=0
fi

($2 < $5 && $3) | $4 >> $new


if cmp -s $6 $new; then
    echo OK
else
    echo FUCK
    diff $6 $new
fi

if (($del == 1)); then
    rm -f $6 $new
fi
