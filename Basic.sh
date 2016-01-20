#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILE=$DIR
echo Please Choose an option
#read -e -p "" -i "" OPT
select yn in "Select a directory" "Run Search" "Current Directory" "Exit" ; do
	case $yn in
		"Select a directory" ) read -e -p "Please enter the directory: " -i "$FILE" FILE
		cd $FILE
		;; 
		
		
		"Run Search" ) 
	
	$DIR/trav.sh > $DIR/trav.txt
	
	#du -h -m --max-depth=1 -h | sort -rn > mapped.txt

	COUNT=$(gawk '{ sum += $3 }; END {print sum }' $DIR/trav.txt)
	echo "total| " $COUNT >> $DIR/trav.txt
	cat $DIR/trav.txt
      	;;
		"Current Directory" ) cd $FILE
		echo "Current Directory:" $FILE;; 
		"Exit" ) echo closing; exit;;
	esac
done
