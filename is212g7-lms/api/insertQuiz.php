<?php
require_once '../include/model/common.php';
$dao = new lmsDAO;

// Get from system later!! Hardcode for now.. Change the following later
$courseid = 2;
$createdby = "jackson.s@allinone.com";
$quiztitle = "End of Section 1 Quiz";
$quizdesc = 'Complete the quiz in order to move to the next section of the course. You have 15 minutes to complete it.';
$duration = "20";
$quizarr = '{"questions": [{ "type": "mcq", "questiondescription": "Choose the following false statement.", "options": ["The printer is able to print in color.", "The printer is able to print in B/W only.", "The printer is only sold and available in black.", "The printer is sold as office-use."], "answer": 0 }, { "type": "tf", "questiondescription": "The printer is able to print in color", "options": ["True", "False"], "answer": 0 }] }';
$finalquiz= 0;

$success = $dao->createQuiz($courseid, $createdby, $quiztitle, $quizdesc, $duration, $quizarr,$finalquiz);
var_dump($success);
?>