#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ];then
        echo "no parameter"
        return 1;
fi

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
}' LEN=$2 $1
