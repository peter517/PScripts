#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#
FILE_NAME=$1
CREATE_TIME=`date +%Y-%m-%d_%H:%M:%S`
SRCRIPT_HEADER="#!/bin/bash\n#Copyright (C) 2010-2020 PScript Project\n#Author:pengjun\n#Email:peter517@126.com\n#CreateTime:${CREATE_TIME}\n#Comments:\n#"

sed -i "1 a$SRCRIPT_HEADER" $FILE_NAME
sed -i "1d" $FILE_NAME

