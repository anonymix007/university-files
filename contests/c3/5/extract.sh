#!/bin/bash
if [ -f "767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt" ]
then
echo File was already extracted
else
cat tardisk* | tar xzpvf -
fi
