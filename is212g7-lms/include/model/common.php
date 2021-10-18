<?php

date_default_timezone_set('Asia/Singapore');

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});


?><?php
