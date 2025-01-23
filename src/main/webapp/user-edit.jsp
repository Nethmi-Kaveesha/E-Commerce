<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return; // Ensure no further processing happens after the redirect
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>

        .form-container {
            max-width: 700px;
            margin: 20px auto;
            padding: 30px;
        }
        .form-label {
            font-size: 15px;
        }
        .form-control, .form-select {
            height: 40px;
            font-size: 15px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 16px;
        }
        .alert {
            font-size: 14px;
        }
        .row-cols-md-2 > .col {
            margin-bottom: 15px;
        }
        h2 {
            margin-top: 50px;
            font-size: 24px;
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<a href="user.jsp" class="btn btn-secondary position-absolute top-40 m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to
</a>
<br>
<br>
<h2>Edit User</h2>

<!-- Success Message -->
<%
    String message = request.getParameter("message");
    if (message != null) {
%>
<div class="alert alert-success" role="alert">
    <%= message %>
</div>
<%
    }
%>


<%
    String error = request.getParameter("error");
    if (error != null) {
%>
<div class="alert alert-danger" role="alert">
    <%= error %>
</div>
<%
    }
%>

<form action="user-update" method="post" class="form-container">
    <div class="row row-cols-md-2">
        <div class="col">
            <div class="mb-3">
                <label for="id" class="form-label">User ID</label>
                <input type="text" id="id" name="user_id" class="form-control" placeholder="Enter User ID" required>
            </div>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="name" class="form-label">User Name</label>
                <input type="text" id="name" name="user_name" class="form-control" placeholder="Enter User Name" required>
            </div>
        </div>
    </div>

    <div class="row row-cols-md-2">
        <div class="col">
            <div class="mb-3">
                <label for="email" class="form-label">User Email</label>
                <input type="email" id="email" name="user_email" class="form-control" placeholder="Enter User Email" required>
            </div>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="role" class="form-label">User Role</label>
                <select id="role" name="user_role" class="form-select" required>
                    <option value="customer">Customer</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
        </div>
    </div>

    <div class="mb-3">
        <label for="is_active" class="form-label">User Active</label>
        <input type="checkbox" id="is_active" name="user_is_active" class="form-check-input" checked>
        <label class="form-check-label" for="is_active">Active</label>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" id="password" name="user_password" class="form-control" placeholder="Enter New Password">
    </div>

    <div class="text-center">
        <button type="submit" class="btn btn-primary">Update User</button>
    </div>
</form>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
