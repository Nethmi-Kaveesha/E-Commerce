<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category Delete</title>
</head>
<body>
<h1>Delete Category</h1>

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

<form action="category-delete" method="post">
    <label for="category_id">Category ID:</label>
    <input type="number" id="category_id" name="category_id" required/>
    <br/><br/>
    <button type="submit">Delete Category</button>
</form>
</body>
</html>
