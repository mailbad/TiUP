<?php
/**
 * 后台程序基础文件
 *
 * @package tools
 * @author
 */

//for test
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 'On');

//引用前端常量和thinkphp基础功能
if (!defined('THINK_PATH'))
{
    if (!defined("APP_NAME"))
    {
        define('APP_NAME', 'task');
        define('APP_PATH', '/tiup/www/apps/task/');
    }
    define('SERVER_SCRIPT_MODE', true);
    require('/tiup/www/apps/common.php');
    C('DB_TYPE', 'mysqlice');
    C('DB_PREFIX', '');
}

//服务器列表，svn文件是server.php.sample，开发机正式机不一样
require(ROOT_DIR.'/tools/server.php');
//数据库函数
require(ROOT_DIR.'/tools/DBConnector.php');

// php位置
$phpcmd = `which php2`;


//中间层数据库配置
$connstr = exec('cat /tiup/config.dbagent | grep DBProxy.DBSetting');
$succ = preg_match('/mysql:\/\/(\w+):([a-zA-Z_0-9\-]+)@(.*?):(\d+)\/(\w+)/', $connstr, $match);
if ($succ)
{
    define('DB_USER', $match[1]);
    define('DB_PASS', $match[2]);
    define('DB_HOST', $match[3]);
    define('DB_PORT', $match[4]);
    define('DB_NAME', $match[5]);
}
else //读取conf文件
{
    define('DB_USER', C('DB_USER'));
    define('DB_PASS', C('DB_PWD'));
    define('DB_HOST', C('DB_HOST'));
    define('DB_PORT', C('DB_PORT'));
    define('DB_NAME', C('DB_NAME'));
}


// 获取某个表的配置信息，创建表时不要写死数据库名，而应获取某个已知表的信息然后创建到同一个库
function getKindInfo($kind)
{
    $db = DBConnector::getInstance();
    $db->init(DB_HOST, DB_USER, DB_PASS, DB_NAME,DB_PORT);
    $info = $db->getKindInfo($kind);
    return $info;
}

// 在相同的数据库上创建表，暂时只支持单表
function addKindInSameDb($srckind, $targetkind, $idfield, $sql)
{
    $db = DBConnector::getInstance();
    $db->init(DB_HOST, DB_USER, DB_PASS, DB_NAME,DB_PORT);
    /*
    $info = $db->getKindInfo($targetkind);
    if ($info !== false && count($info) > 0)
    {
        throw new Exception('table already exist');
    }
    */
    $info = $db->getKindInfo($srckind);
    if ($info === false)
    {
        throw new Exception('src kind not exist: '.$srckind);
    }
    //表已经存在
    $tarinfo = $db->getKindInfo($targetkind);
    if ($tarinfo !== false)
    {
        //暂时允许重复执行
        //return true;
    }
    if (count($info) != 1)
    {
        //throw new Exception('not support');
    }
    $db->deleteKindInfo($targetkind);
    $result = $db->addKindInfo($targetkind, $idfield, $info, $sql);
    if ($result)
    {
       return reloadDbProxy();
    }
    return $result;
}

//执行sql
function executeKind($kind, $sql)
{
    $db = DBConnector::getInstance();
    $db->init(DB_HOST, DB_USER, DB_PASS, DB_NAME,DB_PORT);
    return $db->executeKind($kind, $sql);
}

//重启数据服务中间层
function reloadDbProxy()
{
    $ret = false;
    global $ICE;
    global $ga_dbagent;
    foreach ($ga_dbagent as $server)
    {
        $prx = $ICE->stringToProxy("DBProxyCtrl:tcp -h $server -p 12115 -t 70000")->ice_uncheckedCast("::Space::" . "DBProxyCtrl");//直连端口12115， 在list.webproxy里面查找
        $ret = $prx->reloadDBSetting();
    }
    return $ret;
}

/**
 * 检查并获取排他锁.
 * 如果加锁失败，会结束当前进程
 * 当前进程退出后，该锁会自动解除，这是php内部自动完成的
 *
 * @param string $name
 * @return resource
 */
function lockfile($name, $exit = true)
{
    $lockfp = fopen($name . ".lock", "w");
    if (!$lockfp)
    {
        echo "open lockfile \"{$name}\" failed!\n";
        if ($exit)
        {
            exit;
        }
        else
        {
            return false;
        }
    }

    // 如果没有LOCK_NB，当前进程会一直block直到拿到这个锁
    if (!flock($lockfp, LOCK_EX | LOCK_NB))
    {
        echo "flock failed!\n";
        if ($exit)
        {
            exit;
        }
        else
        {
            return false;
        }
    }

    return $lockfp;
}

// 从配置文件获取服务器列表
function getMidServers($filename = "list.search")
{
    //$lines = file(TOOLS_DIR."/ice/conf/".$filename);
    //$lines = file("/var/bin/".$filename);
    $lines = file("/tiup/".$filename);
    $lasttype = "";
    $type = "";
    $servers = array();
    foreach ($lines as $line)
    {
        $line = trim($line);
        if ($line == "")
        {
            continue;
        }
        if (strpos($line, ":tcp") !== false)
        {
            $pattern1 = "#(.*?):tcp\s+\-h(.*?)\-p\s+(\d+)#";
            if (preg_match_all($pattern1, $line, $result))
            {
                $type = trim($result[1][0]);
                if ($type == "" && $lasttype)
                {
                    $type = $lasttype;
                }
                $host = trim($result[2][0]);
                $port = intval(trim($result[3][0]));
                $lasttype = $type;
                
                $servers[$type][] = array(
                    "host" => $host,
                    "port" => $port,
                );
            }
        }
        else
        {
            $pattern2 = "#(.*?)=(.*?):(\d+)#";
            if (preg_match_all($pattern2, $line, $result))
            {
                $type = trim($result[1][0]);
                if ($type == "" && $lasttype)
                {
                    $type = $lasttype;
                }
                $host = trim($result[2][0]);
                if ($ip)
                {
                    if($host!=$ip)
                    {
                        $lasttype = $type;
                        continue;
                    }
                }
                $port = intval(trim($result[3][0]));
                
                $lasttype = $type;  
                $servers[$type][] = array(
                    "host" => $host,
                    "port" => $port,
                );
            }
        }

    }
    return $servers;
}

function _createIceProxy($type, $ip, $port)
{
    global $ICE;
    global $ice_ctx;

    if (!isset($ice_ctx["CALLER"]))
    {
        ice_ctx_caller();
    }

    //UserSearcher:tcp -h 192.168.134.122 -p 13210
    $proxystr = $type.":tcp -h $ip -p $port";
    $prx = $ICE->stringToProxy($proxystr);
    $prx = $prx->ice_uncheckedCast("::Space::".$type)->ice_context($ice_ctx);

    return $prx;
}


?>
