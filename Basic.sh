#!/bin/bash
#DIR used to keep initial directory 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#FILE used to update file location to user output
FILE=$DIR
echo Please Choose an option
#read -e -p "" -i "" OPT
#user input to determine which menu option they have selected
select yn in "Select a directory" "Run Search" "Current Directory" "Exit" ; do
	#case used to compare user input
	case $yn in
		#sets user input of directory to variable FILE
		"Select a directory" ) read -e -p "Please enter the directory: " -i "$FILE" FILE
		#changes current directory to FILE
		cd $FILE
		;; 
		
		
		"Run Search" ) 
	#Runs trav.sh and outputs content to trav.txt
	$DIR/trav.sh > $DIR/trav.txt
	#creates total of directory
	COUNT=$(gawk '{ sum += $3 }; END {print sum }' $DIR/trav.txt)
	#adds sum to end of file
	echo "total| " $COUNT >> $DIR/trav.txt
	#outputs file
	cat $DIR/trav.txt
      	;;
		"Current Directory" ) cd $FILE
		#shows cirrent directory
		echo "Current Directory:" $FILE;; 
		"Exit" ) echo closing; exit;;
	esac
done
