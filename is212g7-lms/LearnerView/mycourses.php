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
                        <h1 class="font-weight-bolder"></h1>
                    </div>
                </div>
            </div>


            <div class="row mb-5">
                <div class="col">
                    <div class="card mt-4 border-0 shadow-lg ">
                        <div class="card-header bg-maincolor text-white font-weight-bold">
                            <h4 class="text-white ml-2 p-3">My courses</h4>
                        </div>
                        <div class="card-body">
                            <div class="container-fluid">
                                <div class="row" id="enrolled"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function () {
                    var username = '<?php echo($_SESSION['username']) ?>';
                    let enrolledCourses = getEnrolledCourses(username)
                    console.log(enrolledCourses)


                    $.each(enrolledCourses, function(key, value) {
                        //hardcode the progress for now
                        var progress ='';
                        if (value.Status=="In-Progress"){
                            console.log("inprogres")
                            progress = `<div class="progress mb-3"><div class="progress-bar bg-warning" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div></div>`;
                        } else if (value.Status == "Completed"){
                            progress= `<h6>Completed</h6>`;
                        } else {
                            progress = `<h6>Withdrawn/Failed</h6>`;
                        }
                        $("#enrolled").append("<div class='col-md-12'><div class='card mb-3' id='course-" + value.CourseID + "'><div class='card-body'><h5 class='card-title'>" + value.CourseTitle + " ("+value.ClassTitle+")</h5>"+progress+"<button type='button' id='"+value.ClassID+"' class='btn btn-info'>View class</button></div></div></div>")
                    });


                });

            </script>
        </div>
    </div>



</body>
</html>


<?php

?>

