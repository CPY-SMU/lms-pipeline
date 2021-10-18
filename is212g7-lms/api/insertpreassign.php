<?php
require_once '../include/model/common.php';

$dao = new lmsDAO;

// Get from system later!! Hardcode for now.. Change the following later
$courseid = 4;
$classid = 7;
$username = "elijah.m@allinone.com";
$todaydate = date('Y-m-d H:i:s');
$status = "In-Progress";

$success = $dao->PreassignStudents($courseid, $classid, $username, $todaydate, $status);
var_dump($success);
?>