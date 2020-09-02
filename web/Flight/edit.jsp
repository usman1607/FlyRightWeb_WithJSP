<%@ page import="com.flyright.model.Flight" %>
<%@ page import="com.flyright.repository.FlightRepository" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/28/2020
  Time: 12:09 PM
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



    <title>Home - Fly Right Airline</title>
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
                        <a class="dropdown-item" href="../Flight/list.jsp">All Flights</a>
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

    <div class="container align-center">

        <div class="row mt-5 mb-5">

            <div class="col-md-7">
                <div class="card">
                    <div class="card-header">
                        <h3 class="header-title">Edit Flight Details</h3>
                    </div>

                    <div class="card-body">

                        <%Flight flight = null;%>
                        <%if(request.getMethod().equalsIgnoreCase("GET")) {
                            String number = request.getParameter("number");
                            FlightRepository flightRepository = new FlightRepository();
                            flight = flightRepository.find(number);

                        %>
                        <form method="post" >
                            <div class="form-group">
                                <label>Flight Number:</label>
                                <input type="text" class="form-control" placeholder="Flight No." name="number" value="<%=flight.getNumber()%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label>Aircraft No.:</label>
                                <input type="text" class="form-control" placeholder="Aircraft No." name="aircraftNo" value="<%=flight.getAircraftNo()%>" required/>
                            </div>
                            <div class="form-group">
                                <label>Price:</label>
                                <input type="number" class="form-control" placeholder="Price" name="price" value="<%=flight.getPrice()%>" required/>
                            </div>
                            <div class="form-group">
                                <label>TakeOff Point</label>
                                <input type="text" class="form-control" placeholder="Take off point" name="takeOff_Point" value="<%=flight.getTakeOff_Point()%>" required/>
                            </div>
                            <div class="form-group">
                                <label>TakeOff Time</label>
                                <input type="datetime-local" class="form-control" placeholder="Take off Time" name="takeOff_time" value="<%=flight.getTakeOff_Time()%>" required/>
                            </div>
                            <div class="form-group">
                                <label>Destination</label>
                                <input type="text" class="form-control" placeholder="Destination" name="destination" value="<%=flight.getDestination()%>" required/>
                            </div>
                            <div class="form-group">
                                <label>AvailableSeats</label>
                                <input type="number" class="form-control" placeholder="AvailableSeats" name="availableSeats" value="<%=flight.getAvailableSeats()%>" required/>
                            </div>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Edit Flight</button>
                        </form>

                        <%}%>
                    </div>
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
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.5.1.min.js"></script>

<script src="../jquery/jquery.min.js"></script>
<script src="../js/bootstrap.js"></script>
</body>

</html>


<%
    if(request.getMethod().equalsIgnoreCase("POST")) {
        //int id = Integer.parseInt(request.getParameter("id"));
        String number = request.getParameter("number");
        String aircraftNo = request.getParameter("aircraftNo");
        double price = Double.parseDouble(request.getParameter("price"));
        String takeOff_Point = request.getParameter("takeOff_Point");

        String pDate = request.getParameter("takeOff_time");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        java.util.Date utilDate = formatter.parse(pDate);
        Date takeOff_Time = new Date(utilDate.getTime());

        String destination = request.getParameter("destination");
        int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));

        FlightRepository flightRepository = new FlightRepository();
        boolean result = flightRepository.updateFli(number, aircraftNo, price, takeOff_Point, takeOff_Time, destination, availableSeats);
        if (result) {
            out.println(String.format("Congrats, you have successfully edit Flight with number: %s", number));
            response.sendRedirect("list.jsp");
        } else
            out.println(String.format("Sorry, %s update failed", number));
    }

%>
