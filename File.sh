#!/bin/bash
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

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
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      DIALOG=${DIALOG=dialog}

FILE=`$DIALOG --stdout --title "Please choose a file" --fselect $PWD/ 14 48`

case $? in
        0)
                echo "\"$FILE\" chosen"
		cd $FILE
		;;
        1)
                echo "Cancel pressed.";;
        255)
                echo "Box closed.";;
esac

      ;;
    2 )


	chmod +rx trav.sh
	chmod 777 trav.txt
	$DIR/trav.sh > $DIR/trav.txt


	#sleep 5 
	COUNT=$(gawk '{ sum += $3 }; END {print sum }' $DIR/trav.txt)
	echo "total| " $COUNT >> $DIR/trav.txt
	dialog --stdout --textbox $DIR/trav.txt 22 70
      	#result = $( $DIR/trav.txt)
	#display_result "mapped"
      ;;
    
  esac
done
