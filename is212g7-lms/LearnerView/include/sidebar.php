<?php echo '
<nav id="sidebar">
            <div class="sidebar-header">
                <h3 class="display-6">All-in-one Learning Management System</h3>
                <strong>LMS</strong>

            </div>

            <ul class="list-unstyled components">
                <li class="p-3"><p class="text-darker" href="explore">Welcome '.$_SESSION['username'].', this is the Learner View<p></li>
                <li>
                                <a href="#">
                                    <i class="fas fa-home"></i>
Dashboard
                                </a>

                </li>
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">
                        <i class="fas fa-book-open"></i>
Courses
                    </a>
                    <ul class="collapse show list-unstyled" id="homeSubmenu">
                        <li class=>
                            <a href="mycourses.php">My Classes</a>
                        </li>
                        <li>
                            <a href="availablecourses.php">View All Available Courses</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-briefcase"></i>
Something else
                    </a>

                </li>
            </ul>

        </nav>
        
        ';

