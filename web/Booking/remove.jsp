<%@ page import="com.flyright.repository.BookingRepository" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2020
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Booking</title>
</head>
<body>

<%
    String number = request.getParameter("number");
    BookingRepository bookingRepository = new BookingRepository();
    boolean result = bookingRepository.removeBook(number);
%>
<% if(result) {%>
<b>Booking <%=number%> Removed Successfully</b>
<%response.sendRedirect("list.jsp");%>
<%} else{%>
<b>Booking <%=number%> Could not be Remomed</b>
<%}%>

</body>
</html>
