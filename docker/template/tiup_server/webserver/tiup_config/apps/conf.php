<?php

/**
 * 每个环境的配置都不相同
 */

// 输出错误信EBUG',false);
define('APP_DEBUG', true);
//define('APP_DEBUG', false);

//define('APP_BUILDING', true);

// 平台域名
define("PDF_HOST", "topdf");
//define("PDF_HOST", "172.18.0.25");
define("TIUP_HOST", "rename.demo.tiup.ren");
// 开放平台域名
define("OPEN_HOST", "open.demo.tiup.ren");
//MapperService
//废弃
//define("MAPPER_HOST", "http://ta-11:81/mappers");
//define("DATA_CENTER_PATH", "ta-10:8080/");
define("DATA_CENTER_PATH", "julydc:8081/v1/");
define('PIC_HTTPTYPE', 'https'); //图片文件协议
//define('PIC_HTTPTYPE', 'http'); //图片文件协议
//define("EDU_CENTER_PATH","http://ta-4:8100");
define("EDU_CENTER_PATH","http://edu-account:8100");
//SEAFILE ADMIN
define("SEAFILE_SERVER", "http://106.120.213.199:8000/");
define("SEAFILE_SERVER_ADMIN_ACCOUNT", "fanzhen@ruc.edu.cn");
define("SEAFILE_SERVER_ADMIN_PASSWORD", "IpqcUaH4HQ5M0q");


//PAY_CONF
define('PAY_HOST', "https://pay.tiup.cn/");
define('PAY_KEY','pd6trdkelie43sf5ewqsyui6g9rdgfdd');

//SEARCH SERVER
//define("SEARCH_ENGINE", "http://ta-4:3000");
define("SEARCH_ENGINE", "http://search:3000");

//融云key
define('RONGCLOUD_APPKEY','qd46yzrf4oyef');
define('RONGCLOUD_APPSECRET','gmneiP9NlO8');

//IMCONFIG
define('IM_HOST','imserver.demo.tiup.ren'); //IM服务器
define('IM_PORT',3010); //端口
//define('IM_HTTPS', "false");
define('IM_HTTPS', "true");


//define("PIC_HOST", "pic.tiup.cn");
//define('IMG_HOST', 'img.tiup.cn');
//define('P_HOST', 'pic.tiup.cn');
//define("PIC_HOST", "pic-img.demo.tiup.ren");
define("PIC_HOST", "upload.rename.demo.tiup.ren");
define('IMG_HOST', 'pic-img.demo.tiup.ren');
define('P_HOST', 'pic-img.demo.tiup.ren');

define('UPLOAD_MAX_SIZE', 210);
// 根目录
define("TIUP_STORE_PATH", '/tiup/file');
!defined("ROOT_DIR") && define("ROOT_DIR", '/tiup/www');

//远程存储目录
define ("FILE_STORE_RPATH", "pic-img::FILE");

// TCS
define('TCS_HOST','https://tcs.tiup.cn');
define('TCS_ONCE_COUNT', 90);
define('TCS_TOKEN','6718185545e55fcff64f180300000b');
define('TCS_TEMPLATE','【图优谱】通知：#notice#，@云消息。');

global $tcs_school_token;
$tcs_school_token = array(
    "239" => "6718185545e55fcff64f180300000b",
    "235" => "544898554ec059cff64f2ebc000006",
    "233" => "554354554ec04ecff64f2ebc000005",
    "288" => '330097561769afcff64f0df3000382'
);

global $tcs_sms_template;
$tcs_sms_template = array(
    '235' => '【微人大】#notice# By 云消息',
    '233' => '您收到一个通知：#notice#，请登录系统查看详情。', //消除北外的签名
    '239' => '【创新盟校】通知：#notice#，@云消息。',
    '288' => '【石大服务中心】通知：#notice#，@云消息。'
);

global $tcs_app_token;
$tcs_app_token = array(
    'serv' => '44386456e90b3bcff64f7773000008',
    'camp' => '71565757148b92cff64f44ce000028'
);

global $tcs_school_config;
$tcs_school_config  = array(
    '235' => array('sms' => true,'email' => true,'weixin' => 'http://222.29.240.53/createqr.php?'),
    '233' => array('sms' => true,'email' => true,'weixin' => 'http://202.204.128.21/createqr.php?'),
    '239' => array('sms' => true,'email' => true,'weixin' => false),
    '288' => array('sms' => false,'email' => true,'weixin' => 'http://mp.upc.edu.cn/messgeservice.aspx?cmd=tiupqr&'),
);


global $g_storage_list;
$g_storage_list = array(
    "file" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
    "photo" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
    "logo" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
    "app" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
    "appfile" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
    "group" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
    "publichomepage" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
    "privacy" => array(
        "id_num" => 0,
        "server_list" => array(
            "0" => "pic-img::FILE",
        ),
    ),
);

?>
