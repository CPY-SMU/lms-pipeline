<?php
require_once '../include/model/common.php';
require_once 'api/getUser.php';
?>

<!DOCTYPE html>
<html>
<head>
    <?php include('../include/header.php'); ?>


    <script src="include/common.js"></script>
    <title>Courses - LMS</title>

    <!-- CSS (Use this section if you need to) -->
    <style>
        button.btn.btn-primary.disabled {
            cursor: not-allowed;
        }

    </style>

</head>
<body>

    <div class="wrapper">
        <!-- Sidebar  -->
        <?php include('include/sidebar.php') ?>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-dark bg-nav py-3 px-5">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>

                    <h4 class="text-darker align-center " href="explore"></h4>
                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">

                            <li class="nav-item">
                                <a class="nav-link" href="explore">Profile<span class="sr-only">(current)</span></a>
                            </li>


                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container content">
                <div class="row">
                    <div class="col">
                        <div id="welcome" class="mt-3 ">
                            <h1 class="font-weight-bolder">Courses</h1>
                        </div>
                    </div>
                </div>


                <div class="row mb-5">
                    <div class="col">
                        <div class="card mt-4 border-0 shadow-lg ">
                            <div class="card-header bg-maincolor text-white font-weight-bold">
                                <h4 class="text-white ml-2 p-3">All Courses offered by LMS</h4>
                            </div>
                            <div class="card-body">
                                <div class="container-fluid">
                                    <div class="row" id="allcourses"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        var username = '<?php echo($_SESSION['username']) ?>';
                        let enrolledCourses = getEnrolledCourses(username)
                        let allcourses = getOpenedCoursesInTheLMS() // get all the details about all the courses including classes, who is teaching, when is enrolment period, etc.

                        var enrolledcourseid = [];

                        $(enrolledCourses).each(function (e) {
                            enrolledcourseid.push(enrolledCourses[e].CourseID)
                        });

                        var groupBy = function (xs, key) {
                            return xs.reduce(function (rv, x) {
                                (rv[x[key]] = rv[x[key]] || []).push(x);
                                return rv;
                            }, {});
                        };
                        var groubedByCourse = groupBy(allcourses, 'CourseID')
                        Object.keys(groubedByCourse).forEach(function (category) {
                            let CourseTitle = '';
                            let taughtby = [];
                            let CourseDescription = '';
                            let days_left = '';
                            let selfenrolmentmsg = '';

                            groubedByCourse[category].forEach(function (memb, i) {
                                CourseTitle = memb.CourseTitle;
                                taughtby.push(memb.EmployeeName);
                                CourseDescription = memb.CourseDescription;
                                days_left = Math.floor((Date.parse(memb.SelfEnrollmentEndDate)-Date.parse(Date())) / 86400000)
                                console.log("courseid",category,CourseTitle,"selfenrolment end date is ", memb.SelfEnrollmentEndDate, 'days left: ',Math.floor((Date.parse(memb.SelfEnrollmentEndDate)-Date.parse(Date())) / 86400000))
                            });

                            // if user is enrolled then do not display info about enrolment period
                            if (enrolledcourseid.includes(category)){
                                selfenrolmentmsg = 'Enrolled/Completed'
                                days_left = -1;
                            } else{
                                selfenrolmentmsg = (days_left >= 0) ? days_left + ' day(s) left before enrolment period is over!' : "Enrolment period has ended.";
                            }

                            var selfenrolmentbtn = (days_left >= 0 ) ? 'btn btn-primary' : "btn btn-primary disabled";
                            var buttonelement = (days_left >= 0) ? "<button type='button' class='" + selfenrolmentbtn + "' onclick='location.href=`selfenrolment.php?course="+category+"`'>Apply for course</button>": "<button type='button' class='" + selfenrolmentbtn + "'>Apply for course</button>";


                            $("#allcourses").append("<div class='col-md-4'><div class='card mb-3' id='course-" + category + "'><div class='card-body'><h5 class='card-title'>" + CourseTitle + "</h5><small class='text-capitalize'>" + taughtby + "</small><button type='button' class='btn btn-primary d-flex mt-1' data-toggle='modal' data-target='#modal-course-" + category + "'>View course information</button><small>" + selfenrolmentmsg + "</small></div></div></div>")

                            $(".container-fluid").append("<div class='modal fade' id='modal-course-" + category + "' tabindex='-1' role='dialog' aria-hidden='true'><div class='modal-dialog modal-dialog-centered' role='document'><div class='modal-content'><div class='modal-header'><h5 class='modal-title' id='exampleModalLongTitle'>" + CourseTitle + "</h5><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><div class='modal-body'>" + CourseDescription + "</div><div class='modal-footer'><button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>"+buttonelement+"</div></div></div></div>")

                        })
                    });

                </script>
            </div>
        </div>



</body>
</html>


<?php

?>

