<%@ page import="com.flyright.model.Booking" %>
<%@ page import="com.flyright.repository.BookingRepository" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2020
  Time: 4:28 PM
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
                        <a class="dropdown-item" href="list.jsp">All Bookings</a>
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
                        <h3 class="header-title">Edit Booking Details</h3>
                    </div>

                    <div class="card-body">

                        <%Booking b = null;%>
                        <%if(request.getMethod().equalsIgnoreCase("GET")) {
                            String number = request.getParameter("number");
                            BookingRepository bookingRepository = new BookingRepository();
                            b = bookingRepository.find(number);

                        %>
                        <form method="post" >
                            <div class="form-group">
                                <label>Booking Number:</label>
                                <input type="text" class="form-control" placeholder="Booking No." name="number" value="<%=b.getNumber()%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label>Flight No.:</label>
                                <input type="text" class="form-control" placeholder="Flight No." name="flighttNo" value="<%=b.getFlightNo()%>" required/>
                            </div>
                            <div class="form-group">
                                <label>TakeOff Time:</label>
                                <input type="datetime-local" class="form-control" placeholder="Date_Time" name="date_Time" value="<%=b.getDate_Time()%>" required/>
                            </div>

                            <div class="form-group">
                                <label>TakeOff Point</label>
                                <input type="text" class="form-control" placeholder="Take off point" name="takeOff_Point" value="<%=b.getTakeOff_Point()%>" required/>
                            </div>

                            <div class="form-group">
                                <label>Destinatio</label>
                                <input type="text" class="form-control" placeholder="Destination" name="destination" value="<%=b.getDestination()%>" required/>
                            </div>

                            <div class="form-group">
                                <label>Seat No.</label>
                                <input type="number" class="form-control" placeholder="Seat No" name="seat_No" value="<%=b.getSeatNo()%>" required/>
                            </div>

                            <button class="btn btn-lg btn-primary btn-block" type="submit">Edit Booking</button>
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

        String number = request.getParameter("number");
        String flighttNo = request.getParameter("flighttNo");
        String takeOff_Point = request.getParameter("takeOff_Point");

        String pDate = request.getParameter("date_Time");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        java.util.Date utilDate = formatter.parse(pDate);
        Date takeOff_Time = new Date(utilDate.getTime());

        String destination = request.getParameter("destination");
        int seat_No = Integer.parseInt(request.getParameter("seat_No"));

        BookingRepository bookingRepository = new BookingRepository();
        boolean result = bookingRepository.update(number, flighttNo, takeOff_Time, takeOff_Point, destination, seat_No);
        if (result) {
            out.println(String.format("Congrats, you have successfully edit Booking with number: %s", number));
            response.sendRedirect("list.jsp");
        } else
            out.println(String.format("Sorry, %s update failed", number));
    }

%>

