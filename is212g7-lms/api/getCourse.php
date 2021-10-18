<?php

require_once '../include/model/common.php';


$dao = new lmsDAO();

$courselist = $dao->retrieveCourses();
//var_dump(phpinfo());
//$ab = json_encode($carparklist);
//var_dump(json_last_error());
//var_dump($ab);
echo json_encode($courselist);
// echo count($courselist);
// echo json_last_error()

// echo ($courselist);
?>