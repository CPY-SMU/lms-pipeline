<?php

require_once '../../include/model/common.php';
$username = $_GET["username"];
$dao = new lmsDAO();
$enroledcourses = $dao->retrieveCompletedCourses($username);

echo json_encode($enroledcourses);
?>