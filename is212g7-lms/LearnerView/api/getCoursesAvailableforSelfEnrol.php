<?php

require_once '../../include/model/common.php';
$dao = new lmsDAO();
$courses = $dao->retrieveAvailableCoursesforSelfEnrolment();

echo json_encode($courses);
?>