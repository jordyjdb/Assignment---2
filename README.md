# Assignment---2
Using batch script to show files/folders information inside a directory, such as size and name

So the assignment wants the me to create a batch script that will show each file/folder inside the directory along with the sizes of each and to use a traversing algorithm to do so. I have used dialog to give the user a better GUI, but have also got a basic text command line menu and I/O if dialog is not available on the machine. 

Each version of my code and my progress are documented from input, starting from input 1. This shows the trail and error which includes try to use java to edit a text file to make the output more appealing and easier to understand, however I removed it as I found a lot of the time that the java reader wasnt compatible. It also shows my the progression of my Assignment along with my thought process and what I planned to do after each step I took. 

The traversal was the hardest part to implement, which replaced the temporary use of the du command. It goes into each directory and does a du inside, giving the total of each file. both files and folders are outputed by the trav.sh and are then outputted to a text file which is then used by either Basic.sh or File.sh. 

How to set up:
- create the 4 batch files that have been submitted to Assignment 2
  - Main.sh
  - Basic.sh
  - File.sh
  - trav.sh
- Make sure that all files are in the same directory and have the same names as the files have been submitted.
- Change the executable state of each batch file to true.
- Run main.sh for automatic selection between dialog GUI and basic Text GUI.
