#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

if [ -z "$1" ] || [ -z "$2" ];then
        echo "no parameter"
        return 1;
fi

date_start=$(date +%s)

awk 'BEGIN{}
{
	value=$(NF);query=$0;

        #当读取前len行时
	if(NR <= N) {
		count[NR - 1]=value;record[NR - 1]=query;

        #当到达len行时，进行一次冒泡排序 
		if(NR == N){

			for(m=0; m < N; m++){
				for(n=N - 1; n > m; n--){

					if(count[n] > count[n - 1]){
						pTemp=count[n];
						count[n]=count[n - 1];
						count[n - 1]=pTemp;

						qTemp=record[n];
						record[n]=record[n - 1];
						record[n - 1]=qTemp; 
					}
				} 
			}
		}
	}

#当取len行之后时
	else{

#找出要插入的位置
		for(k=N - 1; k >= 0; k--){if(value < count[k]) break;}

#对于len行后的数据进行插入排序
		for(i=N - 1; i > k + 1; i--){ count[i]=count[i - 1];record[i]=record[i - 1];}
		count[k + 1]=value;record[k + 1]=query;
	}

}

END{
	for (k=0; k<N;k++)  print record[k];
}' N=$2 $1 

date_end=$(date +%s)
echo "program cost time：$((date_end - date_start))s"
