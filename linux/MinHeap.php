<?php

function cmpFun(&$item1, &$item2) {
	if ($item1 > $item2) {
		return true;
	} else {
		return false;
	}
}

/**
 * 最小堆，堆的大小在构造函数中已经确定
 */
class MinHeap {
	
	private $size;
	private $dataArr;
	private $cmpFun;
	
	function __construct(&$dataArr, $cmpFun) {
		$this->size = count ( $dataArr );
		if (is_array ( $dataArr )) {
			$this->dataArr = $dataArr;
			$this->cmpFun = $cmpFun;
			$this->buildHeap ();
		} else {
			echo "need a array\n";
		}
	}
	
	/**
	 * 
	 * 建堆
	 */
	private function buildHeap() {
		for($i = intval ( $this->size / 2 ); $i >= 0; $i --) {
			$this->minHeap ( $i );
		}
	}
	
	/**
	 * 
	 * 最小化堆
	 */
	private function minHeap($i) {
		
		$cmpFun = $this->cmpFun;
		while ( $i < $this->size ) {
			
			//如果是第一个元素
			if ($i == 0) {
				$leftIndex = 1;
				$rightIndex = 2;
			} else {
				$leftIndex = 2 * $i;
				$rightIndex = 2 * $i + 1;
			}
			
			//找到最小元素
			if ($leftIndex < $this->size && $cmpFun ( $this->dataArr [$i], $this->dataArr [$leftIndex] )) {
				$minIndex = $leftIndex;
			}
			if ($rightIndex < $this->size && $cmpFun ( $this->dataArr [$minIndex], $this->dataArr [$rightIndex] )) {
				$minIndex = $rightIndex;
			}
			
			//如果找不到更小的元素
			if ($minIndex == $i) {
				return;
			}
			
			$temp = $this->dataArr [$minIndex];
			$this->dataArr [$minIndex] = $this->dataArr [$i];
			$this->dataArr [$i] = $temp;
			
			//依然处理该item
			$i = $minIndex;
		
		}
	}
	
	/**
	 * 
	 * 返回堆顶元素，并出堆
	 */
	public function popHeap() {
		
		$temp = $this->dataArr [0];
		$this->dataArr [0] = $this->dataArr [$this->size - 1];
		
		$this->minHeap ( 0 );
		$this->size --;
		return $temp;
	}
	
	/**
	 * 
	 * 返回堆顶元素
	 */
	public function peakHeap() {
		return $this->dataArr [0];
	}
	
	/**
	 * 
	 * 往堆中插入元素，但不影响堆大小
	 */
	public function insertToHeap(&$item) {
		
		$cmpFun = $this->cmpFun;
		$minItem = $this->peakHeap ();
		
		if ($cmpFun ( $item, $minItem )) {
			$this->dataArr [0] = $item;
			$this->minHeap ( 0 );
		}
	}
	
	/**
	 * 
	 * 打印堆信息，但不影响堆
	 */
	public function printHeap() {
		
		$temp = clone $this;
		
	    $bufArr = array();
		$num = $temp->size;
		
		while ( $num -- ) {
			$bufArr [] = $temp->popHeap ();
		}
		
		$len = count($bufArr);
		for ($i = $len - 1; $i >= 0; $i--){
			echo $bufArr[$i];
		}
		
		unset($bufArr);
	}
	
	/**
	 * 
	 * 打印堆信息，同时清空堆
	 */
	public function printHeapAndClear() {
		
		$bufArr = array();
		$num = $this->size;
		
		while ( $num -- ) {
			$bufArr [] = $this->popHeap ();
		}
		
	    $len = count($bufArr);
		for ($i = $len - 1; $i >= 0; $i--){
			echo $bufArr[$i];
		}
		
		unset($bufArr);
	}
	
	/**
	 * 
	 * 获取最小堆列表
	 */
	public function  getDataArr(){
		
		$temp = clone $this;
		
	    $bufArr = array();
		$num = $temp->size;
		
		while ( $num -- ) {
			$bufArr [] = $temp->popHeap ();
		}
		return $bufArr;
	}

}

//Test
class A {
	
	function __construct($a, $b) {
		$this->a = $a;
		$this->b = $b;
	}
	public $a;
	public $b;
	
	function __toString() {
		return $this->a . "\t" . $this->b . "\n";
	}
}

function cmp(&$a1, &$a2) {
	
	if (intval ( $a1->a ) > intval ( $a2->a )) {
		return true;
	} else {
		return false;
	}

}

$a = new A ( 1, 2 );
$b = new A ( 3, 1 );
$c = new A ( 4, 4 );
$d = new A ( 2, 5 );

$arr = array ($a, $b, $c, $d );

$cmpFun = 'cmp';

$m = new MinHeap ( $arr, $cmpFun );
$e = new A ( 5, 3 );
$m->insertToHeap ( $e );

$m->printHeapAndClear ();

