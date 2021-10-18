<?php

require_once '../../include/model/common.php';
$username = $_GET["username"];
$dao = new lmsDAO();
$courses = $dao->retrievePendingCourses($username);

echo json_encode($courses);
?>