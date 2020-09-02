<%@ page import="com.flyright.repository.FlightRepository" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/28/2020
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove Flight</title>
</head>
<body>

    <%
        String number = request.getParameter("number");
        FlightRepository flightRepository = new FlightRepository();
        boolean result = flightRepository.removeFli(number);
    %>
    <% if(result) {%>
    <b>Flight: <%=number%> Removed Successfully</b>
    <%response.sendRedirect("list.jsp");%>
    <%} else{%>
    <b>Flight: <%=number%> Could not be Remomed</b>
    <%}%>

</body>
</html>
