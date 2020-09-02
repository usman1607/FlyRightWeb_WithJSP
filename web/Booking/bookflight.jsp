<%@ page import="com.flyright.model.Flight" %>
<%@ page import="com.flyright.repository.FlightRepository" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flyright.repository.BookingRepository" %>
<%@ page import="com.flyright.repository.PassengerRepository" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2020
  Time: 1:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewfport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    <div>
        <h1 class="h3 mb-3 font-weight-normal text-center">...WELCOME TO FLY RIGHT AIRLINE...</h1>
    </div>

    <div class="container">

        <div class="row mt-5 mb-5">

            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="header-title">Book Flight</h3>
                    </div>

                    <div class="card-body">

                        <%Flight f = null;%>
                        <%if(request.getMethod().equalsIgnoreCase("GET")) {
                            String number = request.getParameter("number");
                            FlightRepository flightRepository = new FlightRepository();
                            f = flightRepository.find(number);
                        %>
                        <form method="post" action="success.jsp?number=bookingNo">
                            <div>
                                <label for="full_name">Full Name:</label>
                                <input type="text" class="form-control" name="full_name" placeholder="John Smith Alex" id="full_name" required/>
                            </div>
                            <div>
                                <label for="email">Email Address:</label>
                                <input type="email" class="form-control" name="email" placeholder="example@something.com" id="email" required/>
                            </div>
                            <div>
                                <label for="address">Address:</label>
                                <input type="text" class="form-control" name="address" placeholder="1, Smith str, Ikeja, Lagos." id="address" />
                            </div>
                            <div>
                                <label for="phone_No">Phone Number:</label>
                                <input type="text" class="form-control" name="phone_No" placeholder="eg:+234-803-1121212" id="phone_No" required/>
                            </div>

                            <input type="hidden" name="number" value="<%=f.getNumber()%>"/>
                            <input type="hidden" name="takeOff_Point" value="<%=f.getTakeOff_Point()%>"/>
                            <input type="hidden" name="destination" value="<%=f.getDestination()%>"/>
                            <input type="hidden" name="takeOff_time" value="<%=f.getTakeOff_Time()%>"/>
                            <input type="hidden" name="availableSeats" value="<%=f.getAvailableSeats()%>"/>

                            <p class="text-center mt-3">*****************************************************</p>

                            <div class="form-group">
                                <label for="payment">Payment Option</label>
                                <select name="" id="payment" class="form-control">
                                    <option value="">-- Select Method--</option>
                                    <option value="Master Card">Master Card</option>
                                    <option value="Transfer">Transfer</option>
                                    <option value="E-Payment">E-Payment</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="master_card">Master Card No.:</label>
                                <input type="number" id="master_card" name="master_card" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="cvv">cvv No.:</label>
                                <input type="number" id="cvv" name="cvv" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="pin">Pin:</label>
                                <input type="password" id="pin" name="password" class="form-control" size="6">
                            </div>

                            <input type="submit" value="Proceed to Payment" name="submitDetails"/>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-6">

                <div class="text-center flight-summary h3 font-weight-normal">
                    <table class="table table-hover table-striped">
                        <th>
                            FLIGHT SUMMARY
                        </th>
                        <tr>
                            <td>FLIGHT NUMBER</td>
                            <td><%=f.getNumber()%></td>
                        </tr>
                        <tr>
                            <td>TAKE OFF POINT</td>
                            <td><%=f.getTakeOff_Point()%></td>
                        </tr>
                        <tr>
                            <td>DESTINATION</td>
                            <td><%=f.getDestination()%></td>
                        </tr>
                        <tr>
                            <td>TAKE OFF TIME</td>
                            <td><%=f.getTakeOff_Time()%></td>
                        </tr>
                        <tr>
                            <td>PRICE</td>
                            <td><%=f.getPrice()%></td>
                        </tr>
                    </table>
                </div>

            </div>



        </div>

    </div>

    <%}%>

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

        String name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone_No = request.getParameter("phone_No");

        String number = request.getParameter("number");
        //double price = Double.parseDouble(request.getParameter("price"));
        String takeOff_Point = request.getParameter("takeOff_Point");
        String destination = request.getParameter("destination");

        String pDate = request.getParameter("takeOff_time");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = formatter.parse(pDate);
        Date takeOff_Time = new Date(utilDate.getTime());
        //SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");

        int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));

        FlightRepository flightRepository = new FlightRepository();
        BookingRepository bookingRepository = new BookingRepository();
        PassengerRepository passengerRepository = new PassengerRepository();
        availableSeats -= 1;
        flightRepository.updateAvaSeat(number, availableSeats);

        int seat_No = availableSeats + 1;

        List<String> b_numbers = bookingRepository.getAllBookingNo();
        String bookingNo = bookingRepository.generateUniqueId(b_numbers);

        boolean result = bookingRepository.createBooking(bookingNo, number, takeOff_Time, takeOff_Point, destination, seat_No);
        if (result) {
            passengerRepository.create(bookingNo, name, address, email, phone_No);
            out.println(String.format("Congrats, you have successfully create Flight with number: %s", number));
//            response.sendRedirect("success.jsp?number=bookingNo");
        } else {
            out.println(String.format("Sorry, %s creation failed", number));
        }
    }

%>



