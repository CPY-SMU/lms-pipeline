<?php
/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

class EnrolmentTests extends PHPUnit_Framework_TestCase
{
//    some test cases on the Enrolment class
    public function testCanGetCourseID()
    {
        $a = new Enrolment(10, "Some course title..", "Some course description", "Some username ...@hello.com", 6, new Date(), "some category", "some Status", new Date(),"Class 100", "trainer@email.com");
        $this->assertEquals(10, $a->getCourseid());
    }

    public function testCanGetCourseTitle()
    {
        $a = new Enrolment(10, "Some course title..", "Some course description", "Some username ...@hello.com", 6, new Date(), "some category", "some Status", new Date(),"Class 100", "trainer@email.com");
        $this->assertEquals("Some course title..", $a->getCourseTitle());
    }

}
