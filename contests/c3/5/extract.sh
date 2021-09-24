#!/bin/bash
if [ -f "767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt" ]
then
echo File was already downloaded and extracted
else
wget "https://downloader.disk.yandex.ru/disk/0a207938dfab2d23cd06d5165a0d2572321388c07ce6149e42b2272da4bcc9af/614e5ae5/SniftOOIkHZAW0a5DiK2t94KoeaUct4hpKI6aGIdAKy5QZau-b_47uz3NR7OQD4kotn7ejRP3kJkECFPk7vbZQ%3D%3D?uid=0&filename=767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt.xz&disposition=attachment&hash=I7zka6PPUb0lzNQYDCXPF44ZITID%2BdkmksqyEZ1vxOXyaEWEqfmLQyVslJ%2BQrSpAq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=application%2Fx-xz&owner_uid=890695834&fsize=541852036&hid=ad9ba5ede464f00a741b25e1678070bf&media_type=unknown&tknv=v2" -O 767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt.xz
unxz 767b5475-ea84-4cf3-965e-6f7ece23e4b7.txt.xz
fi
