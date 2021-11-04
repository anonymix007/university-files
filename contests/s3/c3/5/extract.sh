#!/bin/bash
if [ -f "767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt" ]
then
echo File was already downloaded and extracted
else
curl -L $(yadisk-direct https://disk.yandex.ru/d/VR81CPsFNmHCEA) -o 767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt.xz
unxz -v 767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt.xz
fi
