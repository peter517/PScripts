<?php
/**
 * 统计数据
 */
class Data {
	
	public $query; //查询词
	public $queryCount; //总查询次数
	

	//访问参数
	public $totalCount; //总点击数
	public $asCount; //普通点击
	public $alCount; //阿拉丁点击
	public $behaCount; //交互点击
	public $inloCount; //模拟点击
	public $ppCount; //广告点击
	

	//访问标记，用于描述用户行为
	public $sugCount; //suggestion
	public $seCount; //扩展查询
	public $rsCount; //相关查询
	

	function __construct($query, $count) {
		
		settype ( $this->queryCount, 'int' );
		settype ( $this->totalCount, 'int' );
		settype ( $this->asCount, 'int' );
		settype ( $this->alCount, 'int' );
		settype ( $this->behaCount, 'int' );
		settype ( $this->inloCount, 'int' );
		settype ( $this->ppCount, 'int' );
		settype ( $this->sugCount, 'int' );
		settype ( $this->seCount, 'int' );
		settype ( $this->rsCount, 'int' );
		
		$this->query = $query;
		$this->queryCount = $count;
		
		$this->totalCount = 0;
		$this->asCount = 0;
		$this->alCount = 0;
		$this->behaCount = 0;
		$this->inloCount = 0;
		$this->ppCount = 0;
		
		$this->sugCount = 0;
		$this->seCount = 0;
		$this->rsCount = 0;
	
	}
	
	/**
	 * 增加查询次数
	 */
	function add_queryCount() {
		$this->queryCount += 1;
	}
	
	/**
	 * 修改访问类型统计数据
	 */
	function modify_accessStatistics($accessType) {
		
		if ($accessType == "as") {
			$this->asCount += 1;
		} else if (preg_match ( "/(?=al)/", $accessType )) {
			$this->alCount += 1;
		} else if ($accessType == "beha") {
			$this->behaCount += 1;
		} else if ($accessType == "inlo") {
			$this->inloCount += 1;
		} else if ($accessType == "pp" || $accessType = "ppim" || $accessType = "pl") {
			$this->ppCount += 1;
		}
	
	}
	
	/**
	 * 修改标志统计数据
	 */
	function modify_flagStatistics($flag) {
		
		$flagTable = array ("12" => "SE", "1" => "RS", "8" => "modify", "3" => "SU", "-1" => "none" );
		
		$flagStr = $flagTable [$flag];
		if ($flagStr == "SU") {
			$this->sugCount += 1;
		} else if ($flagStr == "SE") {
			$this->seCount += 1;
		} else if ($flagStr == "RS") {
			$this->rsCount += 1;
		}
	}
	
	function print_statistics() {
		$this->totalCount = $this->asCount + $this->alCount + $this->inloCount + $this->behaCount + $this->ppCount;
		echo $this->queryCount . "\t";
		echo $this->query . "\t";
		echo $this->totalCount . "\t";
		echo $this->asCount . "\t";
		echo $this->alCount . "\t";
		echo $this->behaCount . "\t";
		echo $this->inloCount . "\t";
		echo $this->ppCount . "\t";
		echo $this->sugCount . "\t";
		echo $this->seCount . "\t";
		echo $this->rsCount . "\t";
		
		echo "\n";
	}
	
	function toString() {
		$this->totalCount = $this->asCount + $this->alCount + $this->inloCount + $this->behaCount + $this->ppCount;
		$str = $this->queryCount . "\t" . $this->query . "\t" . $this->totalCount . "\t" . $this->asCount . "\t" . $this->alCount . "\t" . $this->behaCount . "\t" . $this->inloCount . "\t" . $this->ppCount . "\t" . $this->sugCount . "\t" . $this->seCount . "\t" . $this->rsCount;
		return $str;
	}
}