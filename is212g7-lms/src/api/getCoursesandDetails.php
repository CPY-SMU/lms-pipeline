<?php
require_once '../include/model/common.php';

$dao = new lmsDAO();
$courses = $dao->retrieveCertifiedClassJoinCourse();

echo json_encode($courses);
