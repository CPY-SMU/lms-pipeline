<?php
class Course {

    public $courseid;
    public $coursetitle;
    public $coursedescription;
    public function __construct($courseid, $coursetitle, $coursedescription) {
        $this->courseid = $courseid;
        $this->coursetitle = $coursetitle;
        $this->coursedescription = $coursedescription;
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

?>
