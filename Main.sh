#checks to see if dialog is installed on machine
#opens File.sh if it is, else Basic.sh
yum -q list installed dialog &>/dev/null && ./File.sh || ./Basic.sh
