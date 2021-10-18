<?php
require_once '../../include/model/common.php';

$dao = new lmsDAO();
$courseid = $_GET['courseid'];

$courses = $dao->retrieveSpecificCertifiedClassJoinCourse($courseid);
echo json_encode($courses);
?>
