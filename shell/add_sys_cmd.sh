#!bin/bash

if [ -z "$1" ] || [ -z "$2" ];then
	echo "no parameter"
	return 1;
fi

envfile=".bashrc"
cmd=$1
script=$2

cd ~

insertNum=`grep -nw "alias" $envfile | cut -d : -f 1 | tail -1`
 
sed -i $insertNum'a''alias '$cmd'='\"$script\" $envfile 

source .bashrc
echo "add success"

