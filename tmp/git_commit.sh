#!bin/bash

if [ -z "$1" ];then
        echo "no parameter"
        return 1;
fi

commit=$1

git add -A && git commit -m "$commit" && git push


