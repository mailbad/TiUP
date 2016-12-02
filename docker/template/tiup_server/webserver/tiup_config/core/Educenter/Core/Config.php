<?php

namespace Core;

if (file_exists(COURSE_PATH."Core/config.ini")) {
    $configArray = parse_ini_file("Core/config.ini");
    foreach($configArray as $key=>$value)
        define($key, $value);
}

if (file_exists(COURSE_PATH."Core/config.ini")) {
    $configArray = parse_ini_file(COURSE_PATH."Core/config.ini");
    foreach($configArray as $key=>$value)
        define($key, $value);
}
