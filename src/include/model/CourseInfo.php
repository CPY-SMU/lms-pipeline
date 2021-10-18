<?php

class CourseInfo
{
    public $CourseID;
    public $ClassID;
    public $ClassTitle;
    public $TrainerUID;
    public $TotalSlots;
    public $OccupiedSlots;
    public $ClassStartDateTime;
    public $ClassEndDateTime;
    public $SelfEnrollmentStarDate;
    public $SelfEnrollmentEndDate;
    public $CourseTitle;
    public $CourseDescription;
    public $EmployeeName;

    public function __construct($CourseID, $ClassID, $ClassTitle, $TrainerUID, $TotalSlots, $OccupiedSlots, $ClassStartDateTime, $ClassEndDateTime, $SelfEnrollmentStarDate, $SelfEnrollmentEndDate,$CourseTitle,$CourseDescription,$EmployeeName) {
        $this->CourseID = $CourseID;
        $this->ClassID = $ClassID;
        $this->ClassTitle = $ClassTitle;
        $this->TrainerUID = $TrainerUID;
        $this->TotalSlots = $TotalSlots;
        $this->OccupiedSlots = $OccupiedSlots;
        $this->ClassStartDateTime = $ClassStartDateTime;
        $this->ClassEndDateTime = $ClassEndDateTime;
        $this->SelfEnrollmentStarDate = $SelfEnrollmentStarDate;
        $this->SelfEnrollmentEndDate = $SelfEnrollmentEndDate;
        $this->CourseTitle = $CourseTitle;
        $this->CourseDescription = $CourseDescription;
        $this->EmployeeName = $EmployeeName;
    }
}