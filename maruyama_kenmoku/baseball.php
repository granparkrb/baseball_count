<?php

$params = 'ssffpffssp';

$out = 0;
$strike = 0;
$ball = 0;

echo $params . "->";

while ($param = substr($params, $i++, 1)) {
	//echo $param . PHP_EOL;
	//ストライク処理
	if ($param == 's') {
		$strike++;
		if($strike > 2){
			$out++;
			$strike = 0;
			if($out > 2){
				$out = 0;
				$strike = 0;
				$ball = 0;
			}
		}
	}
	//ボール処理
	if ($param == 'b'){
		$ball++;
		if($ball > 3){
			$strike = 0;
			$ball = 0;
		}
	}
	//ヒット処理
	if ($param == 'h') {
		$strike = 0;
		$ball = 0;
	}
	//ピッチャーフライ処理
	if ($param == 'p'){
		$out++;
		$strike = 0;
		$ball = 0;
		if ($out > 2){
			$out = 0;
		}
	}
	//ファウル
	if ($param == 'f') {
		if ($strike <= 1) {
			$strike++;
		}
	}
	
	$delimiter = (substr($params, $i, 1) == false) ? '' : ',';

	//出力処理
	echo $out . $strike . $ball . $delimiter;

}

echo PHP_EOL;
