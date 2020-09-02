<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/30/2020
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewfport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Usman Gee">

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/mycss.css">



    <title>Home - Fly Right Airline</title>
</head>

<body class="bg-img">
<!-- Navigations -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark top-nav">
    <div class="container text-light">
        <a class="navbar-brand" href="index.jsp"><img class="logo-img" src="images/logo.png"></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navber-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="sign_up.jsp">Register</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage Aircraft
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                        <a class="dropdown-item" href="Aircraft/create.jsp">Create Aircraft</a>
                        <a class="dropdown-item" href="Aircraft/list.jsp">All Aircrafts</a>
<%--                        <a class="dropdown-item" href="">Find Aircraft</a>--%>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage Flight
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a class="dropdown-item" href="Aircraft/list.jsp">Create Flight</a>
                        <a class="dropdown-item" href="Flight/list.jsp">All Flights</a>
<%--                        <a class="dropdown-item" href="">Find Flight</a>--%>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage Booking
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
                        <a class="dropdown-item" href="index.jsp">Book A Flight</a>
                        <a class="dropdown-item" href="Booking/list.jsp">All Bookings</a>
                        <a class="dropdown-item" href="Passenger/list.jsp">All Passengers</a>
<%--                        <a class="dropdown-item" href="">Find Booking</a>--%>
<%--                        <a class="dropdown-item" href="">Find Passenger</a>--%>
                    </div>
                </li>
            </ul>
        </div>
    </div>

</nav>

<!-- Header with carousel -->
<header>

</header>

<main class="main-margin-top">
    <div class="container col-4"></div>
    <div class="container col-4">

        <div class="row mt-5 mb-5">

                <div class="card">
                    <div class="card-header">
                        <h3 class="header-title">Contact Us</h3>
                    </div>

                    <div class="card-body">

                        <form class="form" id="message">

                            <label>Full Name:</label>
                            <input type="text" id="fullname" class="form-control" placeholder="Enter your full name..." required>

                            <label>Email:</label>
                            <input type="email" id="email" class="form-control" placeholder="Enter your email..." required>

                            <label>Subject:</label>
                            <input type="text" id="subject" class="form-control" placeholder="Message Subject..." required>

                            <div class="form-group">
                                <label>Message:</label>
                                <textarea name="message" class="form-control" placeholder="Message Subject..." cols="30" rows="5" required></textarea>
                            </div>

                            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                        </form>
                        </form>
                    </div>
                </div>


        </div>
    </div>


</main>
<footer class="fixed-bottom bg-dark">
    <div class="container text-light">
        <p class="text-center">&copy; 2020 &ndash; Fly Right Airline &ndash; All Right Reserved...</p>
    </div>

</footer>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>

<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>

</html>
