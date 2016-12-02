<?php
$URL = '';
$DOC = '';
$SIGN = '';
$PDF_PATH = '/tiup/topdf/topdf/downloads/pdf/';

$URL = $_GET['url'];
$DOC = $_GET['doc'];
$SIGN = $_GET['sign'];

header('Content-type: application/json');

if($URL == '' || $DOC == '' || $SIGN == ''){
	echo '{"status":-1,"msg":"parameters are missing","pdf":""}';
	exit();
}

if($SIGN != md5($URL.$DOC.'UOU889h3hffs1')){
	echo '{"status":-2,"msg":"sign error","pdf":""}';
	exit();
}
//echo '{"status":"0","msg":"roger","pdf":"http://tiup.cn/topdf/downloads/pdf/'.$DOC.'"}';
echo '{"status":"0","msg":"roger","pdf":"http://demo.tiup.ren/topdf/downloads/pdf/'.$DOC.'"}';
//$cmd = "/tiup/topdf/wkhtmltox/bin/wkhtmltopdf  ".$URL." '".$PDF_PATH.$DOC."' >>/tiup/topdf/topdf/log.txt";
$cmd = "echo -en '".$URL." ".$PDF_PATH.$DOC."' |sh /tiup/topdf/wkhtmltox/bin/htmltopdf";
//file_put_contents('log.txt', $cmd);
exec($cmd);
