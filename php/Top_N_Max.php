<?php
include 'querytop100/util/Statistics.php';
include 'SegOfNewcs.php';

/**
 * 对Statistics数组进行冒泡排序
 */
function sortStatsArray($statMap, $len) {
	
	for($i = 0; $i < $len; $i ++) {
		for($j = $len - 1; $j > $i; $j --) {
			if ($statMap [$j - 1]->queryCount < $statMap [$j]->queryCount) {
				$statsTemp = $statMap [$j - 1];
				$statMap [$j - 1] = $statMap [$j];
				$statMap [$j] = $statsTemp;
			}
		}
	}
	
	return $statMap;
}


/**
 * 对Statistics数组进行插入排序
 */
function insertStatsArray($statMap, $stats, $len) {
	
	//找到第一个大于$stats->queryCount的元素
	for($i = $len; $i > 0; $i --) {
		if ($statMap [$i - 1]->queryCount > $stats->queryCount) {
			break;
		}
	}
	//进行插入
	for($j = $len - 1; $j > $i; $j --) {
		$statMap [$j] = $statMap [$j - 1];
	}
	
	$statMap [$i] = $stats;
	return $statMap;
}

$filename = "logdata_newcookiesort_day.txt";
#$filename = "1.txt";
$file = fopen ( $filename, "r" );

$curLen = 0;
$preQuery = "";
$topNum = 10;
$statMap = array ();

while ( ! feof ( $file ) ) {
	
	$line = fgets ( $file );
	
	if (trim ( $line ) == "") {
		continue;
	}
	
	$fields = agent ( trim ( $line ) );
	//获取从大搜索到知道的所有查询，以及相应的权值
	

	$curQuery = $fields ['_Query'];
	
	if ($preQuery == "") {
		$stats = new Data ( $curQuery );
	} else {
		if ($preQuery != $curQuery) {
			//处理旧的stats
			if ($curLen < $topNum) {
				$statMap [$curLen ++] = $stats;
			} else if ($curLen == $topNum) {
				//到达topNum时，进行冒泡排序
				$statMap = sortStatsArray ( $statMap, $curLen);
				$curLen++;
			} else {
				//大于topNum时候，进行插入排序
				$statMap = insertStatsArray ( $statMap, $stats, $topNum );
			}
			//载入新的stats
			$stats = new Data ( $curQuery );
		}
	}
	
	$stats->add_queryCount ();
	$stats->modify_accessStatistics ( $fields ['_AccessType'] );
	$stats->modify_flagStatistics ( $fields ['_F'] );
	
	$preQuery = $curQuery;
}

//处理最后一个行数据
if ($preQuery != "") {
	if ($curLen < $topNum){
		$statMap [$curLen ++] = $stats;
	}else{
		$statMap [$curLen] = $stats;
	}
}

$statMap = sortStatsArray ( $statMap, $curLen);

$c = 0;
foreach ( $statMap as $curLen => $s ) {
	if ($c ++ >= $topNum) {
		break;
	}
	$s->print_statistics ();
}

