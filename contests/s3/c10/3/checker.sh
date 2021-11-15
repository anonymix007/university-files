#!/bin/bash
$1 $2 $3 $4 > tmp.txt
echo $? >> tmp.txt


if ($2 >> chk.txt || $3 >> chk.txt) && $4 >> chk.txt; then
    echo 0 >> chk.txt
else
    echo 1 >> chk.txt
fi

if cmp -s tmp.txt chk.txt; then
    echo OK
else
    echo FUCK
    diff tmp.txt chk.txt
fi

rm -f tmp.txt chk.txt
