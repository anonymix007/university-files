#!/bin/bash
links=39; 
if [ ! -d links ]
then
mkdir links
echo Directory created
else
echo Directory exists
fi
cd links/
ln -s ../$1 0.lnk
for (( i=1; i <= $links; i++ ))
do
ln -s $((i-1)).lnk $i.lnk
#echo ln -s $((i-1)).lnk $i.lnk
done
echo "Last link is $links.lnk"
