<%@ page import="lk.ijse.ecommerceapp.model.User" %><%--
  Created by IntelliJ IDEA.
  User: kavee
  Date: 1/11/2025
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Trendify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <%@ include file="includes/head.jsp" %>
    <style>
    .positioned-img {
    max-width: 100%;
    height: auto;
    width: 800px;
    max-width: 100%;
    position: relative;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
    .positioned-img {
    width: 100%; /* Make image full width on smaller screens */
    }
    }
    </style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<img src="img/184860283041.png" class="positioned-img">
</body>
</html>
