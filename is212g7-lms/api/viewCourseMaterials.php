<?php

#View course materials (learner) 
#Course materials is decided by trainers based on class and section

$classID = 9;
$sectionno = 1;

require_once '../include/model/common.php';

$dao = new lmsDAO();

$courseMaterialsArr = $dao->retrieveTrainingMaterials($classID,$sectionno); ##[TrainingMaterialID, TMArray, classno, sectionno, DisplayOrder]
var_dump($courseMaterialsArr);


?>