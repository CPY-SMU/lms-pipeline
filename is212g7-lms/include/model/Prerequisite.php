<?php

class Prerequisite
{
    public $CourseID;
    public $PrerequisiteID;
    public $CourseTitle;

    public function __construct($CourseID, $PrerequisiteID, $CourseTitle) {
        $this->CourseID = $CourseID;
        $this->PrerequisiteID = $PrerequisiteID;
        $this->CourseTitle = $CourseTitle;
    }
}

