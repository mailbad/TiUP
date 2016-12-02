<?php

return array(
    'host' => 'redis',  // 服务器地址
    'port' => 6379,         // 端口
    'timeout' => 30,         // 连接超时时间（单位：秒）
    'prefix' => 'global:',   // 缓存前缀
    'persistent' => false,  // 是否长久连接
);
