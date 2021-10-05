#!/bin/bash
if [ -f "test8" ]
then
echo File was already downloaded and extracted
else
curl -L $(yadisk-direct https://disk.yandex.ru/d/VR81CPsFNmHCEA) -o tests.tar.xz
unxz -v --stdout tests.tar.xz | tar -x
fi
