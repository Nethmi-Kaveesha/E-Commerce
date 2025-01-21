<%--
  Created by IntelliJ IDEA.
  User: kavee
  Date: 1/11/2025
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Category</title>
</head>
<body>
<h1>Update Category</h1>

<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<!-- Success message -->
<%
    if (message != null) {
%>
<div style="color: green"><%= message %></div>
<%
    }
%>

<!-- Error message -->
<%
    if (error != null) {
%>
<div style="color: red"><%= error %></div>
<%
    }
%>

<form action="category-update" method="post">
    <br/>
    <label for="id">Category ID</label><br/><br/>
    <input type="text" id="id" name="category_id" required/><br/>
    <br/>

    <label for="name">Category Name</label><br/><br/>
    <input type="text" id="name" name="category_name" required/><br/>
    <br/>

    <label for="description">Category Description</label><br/><br/>
    <input type="text" id="description" name="category_description" required/><br/>
    <br/>

    <button type="submit">Update Category</button>
</form>
</body>
</html>
