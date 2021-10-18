<?php
require_once '../../include/model/common.php';
$dao = new lmsDAO;

$courseid = $_GET["courseid"];
$classid = $_GET["classid"];
$username = $_GET["username"];
$todaydate = date('Y-m-d H:i:s');
$status = "Pending";

$success = $dao->selfEnrollmentRequest($courseid, $classid, $username, $todaydate, $status);
echo json_encode($success);
?>