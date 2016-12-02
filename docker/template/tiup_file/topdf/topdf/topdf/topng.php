<?php
$URL = '';
$DOC = '';
$SIGN = '';
$PNG_PATH = '/tiup/topdf/topdf/downloads/png/';

$URL = $_POST['url'];
$DOC = $_POST['doc'];
$SIGN = $_POST['sign'];

header('Content-type: application/json');

if($URL == '' || $DOC == '' || $SIGN == ''){
	echo '{"status":-1,"msg":"parameters are missing","png":""}';
	exit();
}

if($SIGN != md5($URL.$DOC.'UOU889h3hffs1')){
	echo '{"status":-2,"msg":"sign error","png":""}';
	exit();
}

//echo '{"status":"1","msg":"roger","pdf":"http://tiup.cn/topdf/downloads/png/'.$DOC.'"}';
echo '{"status":"1","msg":"roger","pdf":"http://demo.tiup.ren/topdf/downloads/png/'.$DOC.'"}';
$cmd = "/usr/local/sbin/wkhtmltoimage ".$URL." ".$PDF_PATH.$DOC;
exec($cmd);
