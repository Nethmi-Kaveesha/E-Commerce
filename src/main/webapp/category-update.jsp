<%--
  Created by IntelliJ IDEA.
  User: kavee
  Date: 1/11/2025
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return;  // Ensure no further processing happens after the redirect
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <%@ include file="includes/head.jsp" %>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<a href="user.jsp" class="btn btn-secondary position-absolute top-40  m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to
</a>

<div class="container my-5">
    <h1 class="text-center mb-4">Update User</h1>

    <!-- Success message -->
    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
    <div class="alert alert-success text-center" role="alert">
        <%= message %>
    </div>
    <%
        }
    %>

    <!-- Error message -->
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
    <div class="alert alert-danger text-center" role="alert">
        <%= error %>
    </div>
    <%
        }
    %>

    <!-- Update User Form -->
    <form action="user-update" method="post" class="border rounded p-4 shadow-sm">
        <div class="mb-3">
            <label for="id" class="form-label">User ID</label>
            <input type="text" id="id" name="user_id" class="form-control" placeholder="Enter User ID" required>
        </div>

        <div class="mb-3">
            <label for="name" class="form-label">User Name</label>
            <input type="text" id="name" name="user_name" class="form-control" placeholder="Enter User Name" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">User Email</label>
            <input type="email" id="email" name="user_email" class="form-control" placeholder="Enter User Email" required>
        </div>

        <div class="mb-3">
            <label for="role" class="form-label">User Role</label>
            <select id="role" name="user_role" class="form-select" required>
                <option value="customer">Customer</option>
                <option value="admin">Admin</option>
            </select>
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
</div>

<%@ include file="includes/footer.jsp" %>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
