<%@ page import="com.flyright.repository.FlightRepository" %>
<%@ page import="com.flyright.model.Flight" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/28/2020
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewfport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Usman Gee">

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/mycss.css">



    <title>Fly Right Airline - List of All Flights</title>
</head>

<body class="bg-img">
<!-- Navigations -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark top-nav">
    <div class="container text-light">
        <a class="navbar-brand" href="../index.jsp"><img class="logo-img" src="../images/logo.png"></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navber-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../sign_up.jsp">Register</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../contact.jsp">Contact</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage Aircraft
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                        <a class="dropdown-item" href="../Aircraft/create.jsp">Create Aircraft</a>
                        <a class="dropdown-item" href="../Aircraft/list.jsp">All Aircrafts</a>
                        <a class="dropdown-item" href="">Find Aircraft</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage Flight
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a class="dropdown-item" href="../Aircraft/list.jsp">Create Flight</a>
                        <a class="dropdown-item" href="list.jsp">All Flights</a>
                        <a class="dropdown-item" href="">Find Flight</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manage Booking
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
                        <a class="dropdown-item" href="../index.jsp">Book A Flight</a>
                        <a class="dropdown-item" href="../Booking/list.jsp">All Bookings</a>
                        <a class="dropdown-item" href="../Passenger/list.jsp">All Passengers</a>
                        <a class="dropdown-item" href="">Find Booking</a>
                        <a class="dropdown-item" href="">Find Passenger</a>
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

    <div class="container">

        <div class="row mt-5 mb-5">
            <table class="table table-hover table-striped" >
                <caption class="table-head">LIST OF All Flights</caption>
                <tr>
                    <th>
                        ID
                    </th>

                    <th>
                        Flight No.
                    </th>

                    <th>
                        AIRCRAFT NO.
                    </th>

                    <th>
                        PRICE
                    </th>

                    <th>
                        TAKE OFF POINT
                    </th>

                    <th>
                        TAKE OFF TIME
                    </th>

                    <th>
                        DESTINATION
                    </th>

                    <th>
                        AVAILABLE SEATS
                    </th>

                    <th>
                        EDIT
                    </th>

                    <th>
                        REMOVE
                    </th>
                </tr>

                <%
                    FlightRepository flightRepository = new FlightRepository();
                    List<Flight> flightList = flightRepository.getAll();
                    for(Flight f: flightList) {
                %>
                <tr>
                    <td><%=f.getId()%></td>
                    <td><%=f.getNumber()%></td>
                    <td><%=f.getAircraftNo()%></td>
                    <td><%=f.getPrice()%></td>
                    <td><%=f.getTakeOff_Point()%></td>
                    <td><%=f.getTakeOff_Time()%></td>
                    <td><%=f.getDestination()%></td>
                    <td><%=f.getAvailableSeats()%></td>
                    <td><a href="edit.jsp?number=<%=f.getNumber()%>"><button class="btn-warning" name="button">Edit</button></a></td>
                    <td><a href="remove.jsp?number=<%=f.getNumber()%>"><button class="btn-danger" name="button">Delete</button></a></td>
                </tr>
                <%}%>
            </table>
            <p><a href="../index.jsp">Go Back to Home Page</a> </p>

        </div>

    </div>



</main>
<footer class="fixed-bottom bg-dark">
    <div class="container text-light">
        <p class="text-center">&copy; 2020 &ndash; Fly Right Airline &ndash; All Right Reserved...</p>
    </div>

</footer>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.5.1.min.js"></script>

<script src="../jquery/jquery.min.js"></script>
<script src="../js/bootstrap.js"></script>
</body>

</html>