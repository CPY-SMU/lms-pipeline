<?php
require_once '../include/model/common.php';
require_once 'api/getUser.php';
?>
<?php
    $applying_for = $_GET["course"];
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
                        <h1 class="font-weight-bolder"></h1>
                    </div>
                </div>
            </div>


            <div class="row mb-5">
                <div class="col">
                    <div class="card mt-4 border-0 shadow-lg ">
                        <div class="card-header bg-maincolor text-white font-weight-bold">
                            <h4 class="text-white ml-2 p-3">Classes open for self-enrolment at this period</h4>
                        </div>
                        <div class="card-body">
                            <div class="container-fluid">
                                <div class="row" id="displayclasses"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function () {
                    var username = '<?php echo($_SESSION['username']) ?>';
                    var courseid = '<?php echo($applying_for)?>';

                    // get classes about the course that are open for selfenrolment
                    let classes = getCertifiedClassInfoAboutACourse(courseid)

                    //get prerequisite of this class
                    let prequisite = getPrequisites(courseid);
                    var prereqarr = [];
                    var prereqidarr = [];
                    if (prequisite.length >=1){
                        $.each(prequisite,function(key,value){
                            prereqarr.push(value.CourseTitle)
                            prereqidarr.push(value.CourseID)
                        })
                    } else {
                        prereqarr.push("-")
                    }
                    console.log(prequisite)
                    console.log(prereqarr)
                    // get the classes that the student is enrolled in or is awaiting approval
                    let enrolledCourses = getEnrolledCourses(username)
                    let pendingCourses = getPendingCourses(username)
                    var enrolledclassid=[];
                    var pendingclassid=[];

                    $.each(enrolledCourses, function(key, value){
                        enrolledclassid.push(value.ClassID)
                    })

                    $.each(pendingCourses, function(key, value){
                        pendingclassid.push(value.ClassID)
                    })

                    console.log("the current user's enrolled and pending class ids are")
                    console.log("enrolled class id are: ", enrolledclassid)
                    console.log("pending class id are: ", pendingclassid)

                    var StudentCanEnrol= false;

                    // Display classes that are open for self-enrolment
                    $.each(classes, function(key, value) {
                        let classstartdate = new Date(value.ClassStartDateTime);
                        let classenddate = new Date(value.ClassEndDateTime);

                        let selfenrolmentstartdate = new Date(value.SelfEnrollmentStarDate);
                        let selfenrolmentenddate = new Date(value.SelfEnrollmentEndDate);

                        let availableslots = value.TotalSlots - value.OccupiedSlots;
                        var msg;
                        var btnclass;

                        // check if the student is enrolled or pending approval on each of the class
                        if (enrolledclassid.includes(value.ClassID)){
                            msg = 'Currently enrolled';
                            btnclass = 'btn-success disabled';
                        } else if (pendingclassid.includes(value.ClassID)){
                            msg = 'Your application is pending';
                            btnclass = 'btn-warning disabled';
                        } else{
                            msg = 'Apply for this class';
                            btnclass = 'btn-info'
                            StudentCanEnrol = true;
                        }

                        $("#displayclasses").append("<div class='col-md-12'><div class='card mb-3' id='class-" + value.ClassID + "'><div class='card-body'><h5 class='card-title'>" + value.CourseTitle + " ("+value.ClassTitle+")</h5><h6 class='text-capitalize'>Taught By: " + value.EmployeeName + "</h6><h6><span>Class size: "+value.TotalSlots+"</span><span class='pl-3'>Available slots: "+ availableslots +"</span></h6>" + "<h6>Class start date: "+ classstartdate.getDate()+"-"+(classstartdate.getMonth()+1)+"-"+classstartdate.getFullYear() +"</h6><h6>Class end date: "+classenddate.getDate()+"-"+(classenddate.getMonth()+1)+"-"+classenddate.getFullYear()+"</h6><h6>Application period opens from "+selfenrolmentstartdate.getDate()+"-"+(selfenrolmentstartdate.getMonth()+1)+"-"+selfenrolmentstartdate.getFullYear()+" to "+selfenrolmentenddate.getDate()+"-"+(selfenrolmentenddate.getMonth()+1)+"-"+selfenrolmentenddate.getFullYear()+"</h6><h6>Prerequisites: "+prereqarr+"</h6><button type='button' id='"+value.ClassID+"' class='btn "+btnclass+"'>"+msg+"</button></div></div></div>")

                    });

                    // If student has a existing or pending class then he cannot apply for another
                    $("#displayclasses button").on('click',function(){
                        if (!$(this).hasClass("disabled") && StudentCanEnrol){
                            let classid = this.id;
                            let completedprereq = false;

                            if (prereqidarr.length >=1){ // check if student has completed prerequisite
                                let completedCourses = getCompletedCourses(username);
                                console.log('the current user has completed the following courses')
                                console.log(completedCourses)
                                $.each(prereqidarr, function(key, preredcourseid){
                                    $.each(completedCourses, function(k, v){
                                        if (v.CourseID.includes(preredcourseid)){
                                            completedprereq = true;
                                            return
                                        }
                                    })
                                })
                                if (completedprereq) {
                                    var submitapplication = insertselfenrollment(courseid,classid,username);
                                    if (submitapplication){
                                        this.innerHTML = 'Application submitted'
                                        $(this).removeClass('btn-info');
                                        $(this).addClass('btn-warning disabled');
                                        StudentCanEnrol = false; // student can only apply for one class at a time
                                    }
                                } else{
                                    //trigger modal to tell user cannot proceed with applying
                                    $('#prereqmodal').modal('toggle')
                                }
                            } else{ // this course has no prequisites
                                completedprereq = true;
                                // @TODO: also check for if there is pending application for this course already
                                if (completedprereq ){
                                    console.log("can")
                                    var submitapplication = insertselfenrollment(courseid,classid,username);
                                    if (submitapplication){
                                        this.innerHTML = 'Application submitted'
                                        $(this).removeClass('btn-info');
                                        $(this).addClass('btn-warning disabled');
                                        StudentCanEnrol = false; // student can only apply for one class at a time
                                    }
                                }
                            }


                        }
                    })

                });


            </script>
        </div>
    </div>

    <!-- Prerequisite Modal -->
    <div class="modal fade" id="prereqmodal" tabindex="-1" role="dialog" aria-labelledby="prereqmodal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Unable to apply</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    You have not completed the pre-requisites for this course.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>


<?php

?>

