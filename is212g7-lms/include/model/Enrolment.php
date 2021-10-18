<?php

class Enrolment
{
    public $CourseID;
    public $Username;
    public $ClassID;
    public $DateOfEnrollment;
    public $Category;
    public $Status;
    public $DateOfCompletion;
    public $CourseTitle;
    public $CourseDescription;
    public $ClassTitle;
    public $TrainerUID;

    public function __construct($CourseID, $CourseTitle, $CourseDescription, $Username, $ClassID, $DateOfEnrollment, $Category, $Status,$DateOfCompletion,$ClassTitle,$TrainerUID) {
        $this->CourseID = $CourseID;
        $this->CourseTitle = $CourseTitle;
        $this->CourseDescription = $CourseDescription;
        $this->Username = $Username;
        $this->ClassID = $ClassID;
        $this->DateOfEnrollment = $DateOfEnrollment;
        $this->Category = $Category;
        $this->Status = $Status;
        $this->DateOfCompletion = $DateOfCompletion;
        $this->ClassTitle = $ClassTitle;
        $this->TrainerUID = $TrainerUID;
    }

    public function getCourseid() {
        return $this->courseid;
    }
    public function getCourseTitle() {
        return $this->coursetitle;
    }
    public function getCourseDescription() {
        return $this->coursedescription;
    }
}

