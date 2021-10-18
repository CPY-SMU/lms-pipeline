<?php

class lmsDAO
{
    public function retrieveCourses()
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT * FROM course ";
        $stmt = $pdo->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $course_list = [];
        while($row = $stmt->fetch()){
            $course = new Course(
                $row['CourseID'],
                $row['CourseTitle'],
                $row['CourseDescription']
            );
            $course_list[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $course_list;
    }

    public function retrieveEnrolledCourses($username)
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT enrolment.CourseID, course.CourseTitle, course.CourseDescription, enrolment.Username, enrolment.ClassID, enrolment.DateOfEnrollment, enrolment.Category, enrolment.Status, enrolment.DateOfCompletion, class.ClassTitle, class.TrainerUID FROM enrolment
                JOIN course ON course.CourseID = enrolment.CourseID
                JOIN class on class.ClassID = enrolment.classID
                JOIN users on users.Username = class.TrainerUID 
                WHERE enrolment.Username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
            $course = new Enrolment(
                $row['CourseID'],
                $row['CourseTitle'],
                $row['CourseDescription'],
                $row['Username'],
                $row['ClassID'],
                $row['DateOfEnrollment'],
                $row['Category'],
                $row['Status'],
                $row['DateOfCompletion'],
                $row['ClassTitle'],
                $row['TrainerUID']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function retrieveCompletedCourses($username)
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT * FROM enrolment WHERE Username = :username AND Status = 'Completed' ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
            $course = new Enrolment(
                $row['CourseID'],
                $row['CourseTitle'],
                $row['CourseDescription'],
                $row['Username'],
                $row['ClassID'],
                $row['DateOfEnrollment'],
                $row['Category'],
                $row['Status'],
                $row['DateOfCompletion']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function retrievePendingCourses($username)
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT * FROM selfenrolment WHERE Username = :username ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
            $course = new SelfEnrolment(
                $row['CourseID'],
                $row['Username'],
                $row['ClassID'],
                $row['CreatedOn'],
                $row['Status'],
                $row['LastReviewedOn']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function retrieveClass()
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT * FROM class";
        $stmt = $pdo->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $course_list = [];
        while($row = $stmt->fetch()){
            $course = new Course(
                $row['CourseID'],
                $row['ClassID'],
                $row['ClassTitle'],
                $row['TrainerUID'],
                $row['TotalSlots'],
                $row['OccupiedSlots'],
                $row['ClassStartDateTime'],
                $row['ClassEndDateTime'],
                $row['SelfEnrollmentStarDate'],
                $row['SelfEnrollmentEndDate']
            );
            $course_list[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $course_list;
    }

    public function retrieveAvailableCoursesforSelfEnrolment()
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT * FROM class WHERE NOT SelfEnrollmentStarDate= '0000-00-00 00:00:00' AND SelfEnrollmentEndDate > CURRENT_DATE ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
            $course = new Classes(
                $row['CourseID'],
                $row['ClassID'],
                $row['ClassTitle'],
                $row['TrainerUID'],
                $row['TotalSlots'],
                $row['OccupiedSlots'],
                $row['ClassStartDateTime'],
                $row['ClassEndDateTime'],
                $row['SelfEnrollmentStarDate'],
                $row['SelfEnrollmentEndDate']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function retrieveCertifiedClassJoinCourse()
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT class.CourseID, class.ClassID, class.ClassTitle, class.TrainerUID, class.TotalSlots, class.OccupiedSlots, class.ClassStartDateTime, class.ClassEndDateTime, class.SelfEnrollmentStarDate, class.SelfEnrollmentEndDate, course.CourseTitle, course.CourseDescription, users.EmployeeName
                FROM class
                INNER JOIN course ON class.CourseID=course.CourseID
                INNER JOIN users ON class.TrainerUID = users.username
                WHERE class.ClassStartDateTime NOT LIKE '%0000-00-00%' 
                ORDER BY class.SelfEnrollmentEndDate ASC
                ";
        $stmt = $pdo->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
//            var_dump($row['CourseID']);
            $course = new CourseInfo(
                $row['CourseID'],
                $row['ClassID'],
                $row['ClassTitle'],
                $row['TrainerUID'],
                $row['TotalSlots'],
                $row['OccupiedSlots'],
                $row['ClassStartDateTime'],
                $row['ClassEndDateTime'],
                $row['SelfEnrollmentStarDate'],
                $row['SelfEnrollmentEndDate'],
                $row['CourseTitle'],
                $row['CourseDescription'],
                $row['EmployeeName']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function retrieveSpecificClassJoinCourse($courseid) // includes NaN class start dates if HR just created this and has not added trainers yet
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT class.CourseID, class.ClassID, class.ClassTitle, class.TrainerUID, class.TotalSlots, class.OccupiedSlots, class.ClassStartDateTime, class.ClassEndDateTime, class.SelfEnrollmentStarDate, class.SelfEnrollmentEndDate, course.CourseTitle, course.CourseDescription, users.EmployeeName
                FROM class 
                INNER JOIN course ON class.CourseID=course.CourseID
                INNER JOIN users ON class.TrainerUID = users.username
                WHERE class.CourseID = :courseid;";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_INT);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
            $course = new CourseInfo(
                $row['CourseID'],
                $row['ClassID'],
                $row['ClassTitle'],
                $row['TrainerUID'],
                $row['TotalSlots'],
                $row['OccupiedSlots'],
                $row['ClassStartDateTime'],
                $row['ClassEndDateTime'],
                $row['SelfEnrollmentStarDate'],
                $row['SelfEnrollmentEndDate'],
                $row['CourseTitle'],
                $row['CourseDescription'],
                $row['EmployeeName']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function retrieveSpecificCertifiedClassJoinCourse($courseid)
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT class.CourseID, class.ClassID, class.ClassTitle, class.TrainerUID, class.TotalSlots, class.OccupiedSlots, class.ClassStartDateTime, class.ClassEndDateTime, class.SelfEnrollmentStarDate, class.SelfEnrollmentEndDate, course.CourseTitle, course.CourseDescription, users.EmployeeName
                FROM class 
                INNER JOIN course ON class.CourseID=course.CourseID
                INNER JOIN users ON class.TrainerUID = users.username
                WHERE class.CourseID = :courseid AND class.ClassStartDateTime NOT LIKE '%0000-00-00%' 
                AND SelfEnrollmentEndDate > CURRENT_DATE;";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_INT);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
            $course = new CourseInfo(
                $row['CourseID'],
                $row['ClassID'],
                $row['ClassTitle'],
                $row['TrainerUID'],
                $row['TotalSlots'],
                $row['OccupiedSlots'],
                $row['ClassStartDateTime'],
                $row['ClassEndDateTime'],
                $row['SelfEnrollmentStarDate'],
                $row['SelfEnrollmentEndDate'],
                $row['CourseTitle'],
                $row['CourseDescription'],
                $row['EmployeeName']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function retrievePrerequisitesForACourse($courseid)
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT prerequisites.CourseID, prerequisites.PrerequisiteID, course.CourseTitle
            FROM prerequisites
            INNER JOIN course ON prerequisites.CourseID = course.CourseID
            WHERE prerequisites.CourseID = :courseid ;";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_INT);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $arr = [];
        while($row = $stmt->fetch()){
            $course = new Prerequisite(
                $row['CourseID'],
                $row['PrerequisiteID'],
                $row['CourseTitle']
            );
            $arr[] = $course;
        };
        $stmt = null;
        $pdo = null;
        return $arr;
    }

    public function selfEnrollmentRequest($courseid, $classid, $username, $createdon, $status)
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "INSERT INTO selfenrolment (CourseID,ClassID,Username,CreatedOn,Status) VALUES (
                :courseid, :classid,  :username, :createdon, :status
            )
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_STR);
        $stmt->bindParam(':classid', $classid, PDO::PARAM_STR);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->bindParam(':createdon', $createdon, PDO::PARAM_STR);
        $stmt->bindParam(':status', $status, PDO::PARAM_STR);
        $stmt->execute();
        $count = $stmt->rowCount();
        if ($count > 0) {
            $isOk = True;
        } else {
            $isOk = False;
        }
        $stmt = null;
        $pdo = null;

        return $isOk;
    }

    public function PreassignStudents($courseid, $classid, $username, $createdon, $status)
    {
        $category = 'Pre-assigned';
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "INSERT INTO enrolment (CourseID,Username,ClassID,DateOfEnrollment,Category,Status) VALUES (
                :courseid, :username, :classid,  :createdon, :category, :status
            )   
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_STR);
        $stmt->bindParam(':classid', $classid, PDO::PARAM_STR);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->bindParam(':createdon', $createdon, PDO::PARAM_STR);
        $stmt->bindParam(':category', $category, PDO::PARAM_STR);
        $stmt->bindParam(':status', $status, PDO::PARAM_STR);
        $stmt->execute();
        $count = $stmt->rowCount();
        if ($count > 0) {
            $isOk = $this->updateClassInfo($classid, $courseid);
        } else {
            $isOk = False;
        }
        $stmt = null;
        $pdo = null;

        return $isOk;
    }

    public function ApproveSelfEnrolment($selfenrolmentid, $courseid, $classid, $username, $createdon)
    {
        $status = "In-Progress";
        $category = 'Self-Enrolled';
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "INSERT INTO enrolment (CourseID,Username,ClassID,DateOfEnrollment,Category,Status) VALUES (
                :courseid, :username, :classid,  :createdon, :category, :status
            )   
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_STR);
        $stmt->bindParam(':classid', $classid, PDO::PARAM_STR);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->bindParam(':createdon', $createdon, PDO::PARAM_STR);
        $stmt->bindParam(':category', $category, PDO::PARAM_STR);
        $stmt->bindParam(':status', $status, PDO::PARAM_STR);
        $stmt->execute();
        $count = $stmt->rowCount();
        if ($count > 0) {
            $isOk = $this->updateSelfEnrolmentTable($selfenrolmentid,"Approved", $createdon, $classid, $courseid);
        } else {
            $isOk = False;
        }
        $stmt = null;
        $pdo = null;

        return $isOk;
    }

    public function updateSelfEnrolmentTable($selfenrolmentid,$status,$createdon, $classid, $courseid){
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "UPDATE selfenrolment SET status = :status ,	LastReviewedOn = :todaydate WHERE SelfEnrolmentID = :selfenrolmentid
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':selfenrolmentid', $selfenrolmentid, PDO::PARAM_STR);
        $stmt->bindParam(':status', $status, PDO::PARAM_STR);
        $stmt->bindParam(':todaydate', $createdon, PDO::PARAM_STR);
        $stmt->execute();
        $count = $stmt->rowCount();

        var_dump($count);
        if ($count > 0) {
            $isOk = $this->updateClassInfo($classid, $courseid);
        } else {
            $isOk = False;
        }
        $stmt = null;
        $pdo = null;

        return $isOk;
    }

    public function updateClassInfo($classid, $courseid){
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "UPDATE class SET OccupiedSlots = OccupiedSlots +1 WHERE CourseID = :courseid AND ClassID = :classid
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_STR);
        $stmt->bindParam(':classid', $classid, PDO::PARAM_STR);
        $stmt->execute();
        $count = $stmt->rowCount();
        var_dump($count);
        if ($count > 0) {
            $isOk = True;
        } else {
            $isOk = False;
        }
        $stmt = null;
        $pdo = null;

        return $isOk;
    }

    public function createQuiz($courseid, $createdby, $quiztitle, $quizdesc, $duration, $quizarr,$finalquiz)
    {
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "INSERT INTO quiz (CourseID,CreatedBy,QuizTitle,QuizDescription,Duration,QuizArray,FinalQuiz) VALUES (
                :courseid, :createdby, :quiztitle, :quizdesc, :duration, :quizarr, :finalquiz
            )
        ";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':courseid', $courseid, PDO::PARAM_STR);
        $stmt->bindParam(':createdby', $createdby, PDO::PARAM_STR);
        $stmt->bindParam(':quiztitle', $quiztitle, PDO::PARAM_STR);
        $stmt->bindParam(':quizdesc', $quizdesc, PDO::PARAM_STR);
        $stmt->bindParam(':duration', $duration, PDO::PARAM_STR);
        $stmt->bindParam(':quizarr', $quizarr, PDO::PARAM_STR);
        $stmt->bindParam(':finalquiz', $finalquiz, PDO::PARAM_STR);
        $stmt->execute();
        $count = $stmt->rowCount();
        if ($count > 0) {
            $isOk = True;
        } else {
            $isOk = False;
        }
        $stmt = null;
        $pdo = null;

        return $isOk;
    }

    public function retrieveTrainingMaterials($classid,$sectionno){
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();
        $sql = "SELECT * FROM trainingmaterial WHERE classid = :classid && sectionno = :sectionno";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':classid', $classid, PDO::PARAM_STR);
        $stmt->bindParam(':sectionno', $sectionno, PDO::PARAM_STR);
        $stmt->execute();
        $result = [];
        $stmt->setFetchMode(PDO::FETCH_ASSOC);

        while($row = $stmt->fetch()){
            $result[] = $row;
        }

        $stmt = null;
        $pdo = null;
        return $result;

    }
}