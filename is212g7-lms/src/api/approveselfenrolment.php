<?php
require_once '../include/model/common.php';
$dao = new lmsDAO;

// Get from system later!! Hardcode for now.. Change the following later
$courseid = 1;
$classid = 9;
$username = "gabriel_ong@allinone.com";
$todaydate = date('Y-m-d H:i:s');
$selfenrolmentid = 5;

$success = $dao->ApproveSelfEnrolment($selfenrolmentid, $courseid, $classid, $username, $todaydate);
var_dump($success);
?>