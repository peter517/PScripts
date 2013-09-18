#!bin/bash

if [ -z "$1" ];then
        echo "no parameter"
        return 1;
fi

git add -A && git commit -m "$1" && git push


