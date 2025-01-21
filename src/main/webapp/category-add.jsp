<%--
  Created by IntelliJ IDEA.
  User: kavee
  Date: 1/11/2025
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save Category</title>
</head>
<body>
<h1>Save Category</h1>

<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<!-- Success Message -->
<%
    if (message != null) {
%>
<div style="color: green"><%= message %></div>
<%
    }
%>

<!-- Error Message -->
<%
    if (error != null) {
%>
<div style="color: red"><%= error %></div>
<%
    }
%>

<!-- Category Form -->
<form action="category-save" method="post">
    <br/>
    <label for="category_name">Category Name</label>
    <input type="text" id="category_name" name="category_name"/><br/>

    <br/>
    <label for="category_description">Category Description</label>
    <input type="text" id="category_description" name="category_description"/><br/>
    <br/>

    <button type="submit">Save Category</button>
</form>
</body>
</html>
