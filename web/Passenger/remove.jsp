<%@ page import="com.flyright.repository.PassengerRepository" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2020
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Passenger</title>
</head>
<body>

<%
    String bookingNo = request.getParameter("bookingNo");
    PassengerRepository passengerRepository = new PassengerRepository();
    boolean result = passengerRepository.removePers(bookingNo);
%>
<% if(result) {%>
<b>Passenger with <%=bookingNo%> Removed Successfully</b>
<%response.sendRedirect("list.jsp");%>
<%} else{%>
<b>Passenger with <%=bookingNo%> Could not be Remomed</b>
<%}%>

</body>
</html>
