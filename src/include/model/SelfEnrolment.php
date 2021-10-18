<?php

class SelfEnrolment
{
    public $CourseID;
    public $Username;
    public $ClassID;
    public $CreatedOn;
    public $Status;
    public $LastReviewedOn;

    public function __construct($CourseID, $Username, $ClassID, $CreatedOn, $Status, $LastReviewedOn) {
        $this->CourseID = $CourseID;
        $this->Username = $Username;
        $this->ClassID = $ClassID;
        $this->CreatedOn = $CreatedOn;
        $this->Status = $Status;
        $this->LastReviewedOn = $LastReviewedOn;
    }

}
