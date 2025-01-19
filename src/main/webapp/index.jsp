<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
User user = (User) request.getSession().getAttribute("user");
if (user != null) {
    request.setAttribute("user", user);
    }
%>
<!DOCTYPE html>

<html>
<head>
    <title>Welcome To Shopping Cart!</title>
    <%@include file="includes/head.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Link to FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<!-- Include Bootstrap JS (required for navbar toggle functionality) -->

<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
