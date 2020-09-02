<%@ page import="com.flyright.repository.AircraftRepository" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/26/2020
  Time: 9:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove Aircraft</title>
</head>
<body>
    <%
        String reg_No = request.getParameter("reg_No");
        AircraftRepository aircraftRepository = new AircraftRepository();
        boolean result = aircraftRepository.removeAir(reg_No);
    %>
    <% if(result) {%>
    <b>Aircraft: <%=reg_No%> Removed Successfully</b>
    <%response.sendRedirect("list.jsp");%>
    <%} else{%>
    <b>Aircraft: <%=reg_No%> Could not be Remomed</b>
    <%}%>

</body>
</html>


