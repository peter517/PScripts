
<?php

include 'SegOfNewcs.php';
/**
 * 解析域名对应中文名称的日志
 */
function agentForSiteToCNameLog() {
	
	$siteMap = array ();
	
	$filename = "domainToCName.txt";
	
	$file = fopen ( $filename, "r" );
	
	while ( ! feof ( $file ) ) {
		$line = fgets ( $file );
		list ( $url, $name ) = explode ( "\t", rtrim ( $line ) );
		$siteMap [$url] = $name;
	}
	
	return $siteMap;

}

/**
 * 解析IP对应城市的日志
 */
function agentForIpToCityLog() {
	
	$None = "None";
	$ipToCityMap = array ();
	$filename = "ipindex_record.txt";
	
	$file = fopen ( $filename, "r" );
	
	while ( ! feof ( $file ) ) {
		
		$line = fgets ( $file );
		
		$arr = explode ( "|", rtrim ( $line ) );
		
		$ipStart = $arr [0];
		$ipEnd = $arr [1];
		$provice = $arr [2];
		$city = $arr [3];
		
		//不考虑省份和城市为None的IP
		if ($provice == $None && $city == $None) {
			continue;
		}
		
		$key = $ipStart . ":" . $ipEnd;
		$value = $provice . "-" . $city;
		
		$ipToCityMap [$key] = $value;
	
	}
	return $ipToCityMap;
}

function cmpIp($ip1, $ip2) {
	
	for ($i = 0; $i < 4; $i++){
	if (intval ( $ip1[$i] ) < intval ( $ip2 [$i] )) {
			return - 1;
	}
	if (intval ( $ip1[$i] ) > intval ( $ip2 [$i] )){
		return 1;
	}
	}
	
	return 1;
}

$domainMap = agentForSiteToCNameLog ();
$ipToCityMap = agentForIpToCityLog ();


$filename = "1.txt";
$file = fopen ( $filename, "r" );

while ( ! feof ( $file ) ) {
	
	$line = fgets ( $file );
	
	if (rtrim ( $line ) == "") {
		continue;
	}
	
	$fields = agent ( rtrim ( $line ) );
	
	if ($fields ['_AccessType'] != "inlo") {
		
		preg_match_all ( '/([a-z0-9])+\.(com|net|cn)+/i', $fields ['_Url'], $site );
		$domainCName = $domainMap [$site [0] [0]]; //获得域名中文名称

		if ($domainCName != "") {
			//if($c++ >3){continue;}
			//根据IP得出对应的城市名称
			$ipArr = explode ( ".", $fields ['_Ip'] );
			echo "ipArr = ";
			print_r($ipArr);
			foreach ( $ipToCityMap as $ip => $city ) {
				
				list ( $ipStart, $ipEnd ) = explode ( ":", $ip );
				
				$ipStartArr = explode ( ".", $ipStart );
				
				if (cmpIp ( $ipArr, $ipStartArr ) >= 0) {
					
					$ipEndArr = explode ( ".", $ipEnd );
					if (cmpIp ( $ipArr, $ipEndArr ) <= 0) {
						
					echo "ipEndArr = ";
				    print_r($ipEndArr);
						echo "(" . $domainCName . ",", $city . ")" . "\n";
					}
				}
			}
		}
	}
}
