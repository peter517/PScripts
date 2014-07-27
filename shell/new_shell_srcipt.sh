#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	create the model of a new shell script

test -z $1 && "no parm" && return

FILE_NAME=$1
CREATE_TIME=`date +%Y-%m-%d_%H:%M:%S`
SRCRIPT_HEADER="#!/bin/bash\n#Copyright (C) 2010-2020 PScript Project\n#Author:pengjun\n#Email:peter517@126.com\n#CreateTime:${CREATE_TIME}\n#Comments:\n#"

touch $FILE_NAME
echo -e $SRCRIPT_HEADER > $FILE_NAME
LINE_NUM=`echo -e $SRCRIPT_HEADER | wc -l`

vim $FILE_NAME +$LINE_NUM 
