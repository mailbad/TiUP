<?php
function uuid() {
    return str_replace('.','',uniqid("", true));
}

function getTime($file) {
    $vtime =  exec("ffmpeg -i ".$file." 2>&1 | grep 'Duration' | cut -d ' ' -f 4 | sed s/,//");
    return $vtime;
}

function getVideoCover($file, $name, $time) {
        if (empty($time)) $time = '10';
        $strlen = strlen($file);
        $videoCoverName = "/tiup/picture/" . $name . '.jpg';
 
        exec("ffmpeg -ss ".$time." -i ".$file." -y -f mjpeg -t 0.001 -s 320x240 ".$videoCoverName."", $out, $status);
 
        //if ( $status == 0 ) return 'http://' . $_SERVER['SERVER_ADDR'] . '/' . $name . '.jpg';
        if ( $status == 0 ) return 'http://edu-mp4.demo.tiup.ren/' . $name . '.jpg';
        else if ( $status == 1 ) return "";
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    
    $uploadDir = '/tiup/media/';
    $extend = pathinfo($_FILES['file']['name']);  
    $extend = strtolower($extend["extension"]);
    $uploadName = uuid();
    $uploadFile = $uploadName.".$extend";
    $uploadPath = $uploadDir . $uploadFile;
    
    $result = array("code" => 400, "message" => "Something error");
    if ($_FILES["file"]["error"] > 0) {
         $result["message"] = "File upload error: " . $_FILES["file"]["error"];
    } else if ($extend == "flv") {
        $res=1;
        system("yamdi -i ".$_FILES['file']['tmp_name']." -o $uploadPath", $res);
        if (!$res) {
            $result["code"] = 200;
            $result["message"] = "Successfully uploaded";
            //$result["path"] = 'http://' . $_SERVER['SERVER_ADDR'] . '/' . $uploadFile;
            $result["path"] = 'http://edu-mp4.demo.tiup.ren/' . $uploadFile;
        }
    } else if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadPath)) {
            $result["code"] = 200;
            $result["message"] = "Successfully uploaded";
            //$result["path"] = 'http://' . $_SERVER['SERVER_ADDR'] . '/' . $uploadFile;
            $result["path"] = 'http://edu-mp4.demo.tiup.ren/' . $uploadFile;
    } else {
    }
    if ($result["code"] == 400) {
        http_response_code(400);
    } else {
	$result["time_length"] = getTime($uploadPath);
	$result["show_pic"] = getVideoCover($uploadPath, $uploadName);
    }

} else {
    http_response_code(400);
    $result["message"] = "Method not post";
}
echo json_encode($result);
