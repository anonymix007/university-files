#!/bin/bash

if (($2 == 0)); then
   $1 > files/tmp.txt
   touch files/chk.txt
elif (($2 == 1)); then
   $1 $3 > files/tmp.txt
   $3 > files/chk.txt
elif (($2 == 2)); then
   $1 $3 $4 > files/tmp.txt
   ($3 | $4) > files/chk.txt
elif (($2 == 3)); then
   $1 $3 $4 $5 > files/tmp.txt
   ($3 | $4 | $5) > files/chk.txt
elif (($2 == 4)); then
   $1 $3 $4 $5 $6 > files/tmp.txt
   ($3 | $4 | $5 | $6) > files/chk.txt
fi

if cmp -s files/tmp.txt files/chk.txt; then
    echo OK
else
    echo FUCK
    diff files/tmp.txt files/chk.txt
fi

rm -f files/tmp.txt files/chk.txt
