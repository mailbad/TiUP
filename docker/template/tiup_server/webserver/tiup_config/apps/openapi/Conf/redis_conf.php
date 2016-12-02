<?php

if (defined('DEV')) {
	return array(
		'host' => 'redis',  // 服务器地址
		'port' => 6379,         // 端口
		'timeout' => 30,         // 连接超时时间（单位：秒）
		'prefix' => 'open:',    // 缓存前缀，区分不同项目
		'persistent' => false,  // 是否长久连接
	);
} else {
	return array(
		'host' => 'redis',  // 服务器地址
		'port' => 6379,         // 端口
		//'passwd' => 'qdT9Wsp33KAKZpKB9zA3r2YnUp2bD8UDEu',	// 密码
		'timeout' => 30,         // 连接超时时间（单位：秒）
		'prefix' => 'open:',    // 缓存前缀，区分不同项目
		'persistent' => false,  // 是否长久连接
	);
}
