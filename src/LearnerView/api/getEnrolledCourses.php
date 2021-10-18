<?php

require_once '../../include/model/common.php';
$username = $_GET["username"];
$dao = new lmsDAO();
$enroledcourses = $dao->retrieveEnrolledCourses($username);

echo json_encode($enroledcourses);
?>