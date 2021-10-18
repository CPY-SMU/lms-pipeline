<?php
require_once '../include/model/common.php';

$dao = new lmsDAO();

$classlist = $dao->retrieveClass();
//var_dump(phpinfo());
//$ab = json_encode($carparklist);
//var_dump(json_last_error());
//var_dump($ab);
echo json_encode($classlist);
// echo json_last_error()
