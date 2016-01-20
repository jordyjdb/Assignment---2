#!/bin/bash
# Traverse a directory using depth first traversal technique
# Usage $0 directorypath
# otherwise it takes current working directory as directory path

depth()
{
#Do a small depth checking how deep into the tree we are
k=0
while [ $k -lt $1 ]
do
echo -n " "
let k++
#or use k=`expr $k + 1`
done
}

traverse()
{
# Traverse a directory

ls "$1" | while read i
do
depth $2
if [ -d "$1/$i" ]
then
output=$(du -bs --max-depth=0 --block-size=1KB 2>/dev/null "$1/$i")
echo "dir. | " $output

else

result=$(du -ab --max-depth=0 --block-size=1KB  "$1/$i")
echo "file | " $result
fi
done
}

# $1 is directory path

if [ -z "$1" ]
then
# Here we are giving '0' is the current depth of direcory
traverse . 0
else
traverse $1 0
fi
