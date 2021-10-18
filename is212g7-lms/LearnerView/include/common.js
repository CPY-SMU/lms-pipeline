$(document).ready(function () {

    // if html url is same as href then make the element active
    var current_page = window.location.pathname.split("/").pop();
    $("#homeSubmenu li a").each(function () {
        if (current_page == this.href.split("/").pop()) {
            $(this).closest("li").addClass("active")
        }
    });

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

});

var project_root_path = '../'

function getEnrolledCourses(username) {
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + "getEnrolledCourses.php?username=" + username;
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getPendingCourses(username) {
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + "getPendingCourses.php?username=" + username;
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getAllCourses(){
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = project_root_path + 'api/'+ 'getCourse.php';
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getOpenedCoursesInTheLMS(){
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = project_root_path + 'api/'+ 'getCoursesandDetails.php';
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getCoursesAvailableToEnrol(){
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + 'getCoursesAvailableforSelfEnrol.php';
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getClassInfoAboutACourse(courseid){ //includes newly created classes with no real start/end dates.
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + 'getClassInfoForACourse.php?courseid=' + courseid;
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getCertifiedClassInfoAboutACourse(courseid){ // returns classes that only have real start/end dates
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + 'getCertifiedClassInfoForACourse.php?courseid=' + courseid;
    web.open('GET', uri, false);
    web.send();
    return result;
}

function insertselfenrollment(courseid,classid,username){
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + 'insertselfenrolment.php?courseid=' + courseid + '&classid=' + classid + '&username=' +username ;
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getPrequisites(courseid){
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + 'getPrerequisites.php?courseid=' + courseid ;
    web.open('GET', uri, false);
    web.send();
    return result;
}

function getCompletedCourses(username){
    let result;
    const web = new XMLHttpRequest();
    web.onreadystatechange = function () {
        if (web.readyState == 4 && web.status == 200) {
            result = JSON.parse(this.responseText);
        }
    };
    let uri = "api/" + 'getCompletedCourses.php?username=' + username ;
    web.open('GET', uri, false);
    web.send();
    return result;
}

