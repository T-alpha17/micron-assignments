#!/bin/bash
echo "Enter the directory absolute path" 
read path
echo "Enter the file name"
read filename
size=$(du -s $path | awk '{print $1}')
threshold=10000
if [ $size -gt $threshold ]; then 
	echo "The file size is greater than 100 mb"
	tar -cvzf $filename.tar.gz $filename
	rm $filename
	touch $filename
	
else 
	echo "The file size is less than 100 mb"
fi
