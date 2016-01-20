#!/bin/bash
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
#DIR used to keep initial directory 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}
#loops menu
while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "System Information" \
    --title "$PWD" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 4 \
    "1" "Directory Selection" \
    "2" "Run search" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  #used to determine what to do based on user input
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      DIALOG=${DIALOG=dialog}
#sets user input of directory to variable FILE
FILE=`$DIALOG --stdout --title "Please choose a file" --fselect $PWD/ 14 48`

case $? in
        0)
                echo "\"$FILE\" chosen"
                #changes current directory to FILE
		cd $FILE
		;;
        1)
                echo "Cancel pressed.";;
        255)
                echo "Box closed.";;
esac

      ;;
    2 )

	#sets permissions to files
	chmod +rx trav.sh
	chmod 777 trav.txt
	#Runs trav.sh and outputs content to trav.txt
	$DIR/trav.sh > $DIR/trav.txt
	#creates total of directory
	COUNT=$(gawk '{ sum += $3 }; END {print sum }' $DIR/trav.txt)
	#adds sum to end of file
	echo "total| " $COUNT >> $DIR/trav.txt
	#outputs file through dialog text box
	dialog --stdout --textbox $DIR/trav.txt 22 70
      ;;
    
  esac
done
