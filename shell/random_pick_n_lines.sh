#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	random pick n line of a file

if [ -z "$1" ] || [ -z "$2" ];then
        echo "no parameter"
        return 1;
fi

FILE_NAME=$1
N_FOR_PICK=$2

awk 'BEGIN{srand()}
{

  value=$(NF - 1);query=$0;

  #当读取前LEN行时
  if(NR <= LEN) {count[NR - 1]=value; record[NR - 1]=query;}
  
  #当读取LEN行以后的
  else{
     
     #生成0~(NR-1)的随机数
     rNum=int(rand() * NR);

     #如果在长度为LEN的数组范围内，则用记录当前值更新数组
     if(rNUm < LEN){count[rNum]=value; record[rNum]=query;}
     
 }

}

END{
for (k=0; k<LEN; k++)  print record[k];
}' LEN=$N_FOR_PICK $FILE_NAME
