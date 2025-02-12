<%@ page import="lk.ijse.ecommerceapp.model.User" %>
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
    <title>User Management System</title>
    <%@ include file="includes/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 900px;
            margin-top: 50px;
            text-align: center;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            font-size: 1.2rem;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #218838;
        }

        h1 {
            font-size: 2.5rem;
            color: #343a40;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .links a {
            text-decoration: none;
            color: #fff;
            padding: 15px 30px;
            border-radius: 50px;
            margin: 10px;
            font-size: 1.2rem;
            display: inline-block;
            width: 220px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .links a.add-user {
            background-color: #007bff;
        }

        .links a.view-users {
            background-color: #17a2b8;
        }

        .links a.update-user {
            background-color: #ffc107;
        }

        .links a.delete-user {
            background-color: #dc3545;
        }

        .links a:hover {
            transform: translateY(-5px);
        }

        @media (min-width: 768px) {
            .links {
                display: flex;
                justify-content: center;
                gap: 20px;
            }
        }
    </style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<div class="container">
    <h1>User Management System</h1>

    <div class="links">
        <a href="user-add.jsp" class="btn add-user">Add New User</a>
        <a href="user-list" class="btn view-users">View All Users</a>
        <a href="user-edit.jsp" class="btn update-user">Update User</a>
        <a href="user-delete.jsp" class="btn delete-user">Delete User</a>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
