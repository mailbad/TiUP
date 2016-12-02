<?php
$DOC = '';
$DOC = urldecode($_GET['doc']);

header('Content-type: application/json');

if($DOC ==''){
	echo '{"status":-1,"msg":"doc are missing"}';
	exit();
};

$FILE = '/tiup/topdf/topdf/downloads/pdf/'.$DOC;

if(file_exists($FILE)){
//	echo '{"status":0,"msg":"ready to download","file":"http://tiup.cn/topdf/downloads/pdf/'.$DOC.'"}';
	echo '{"status":0,"msg":"ready to download","file":"http://demo.tiup.ren/topdf/downloads/pdf/'.$DOC.'"}';
}else{
	echo '{"status":-1,"msg":"genarating,please wait."}';
}
