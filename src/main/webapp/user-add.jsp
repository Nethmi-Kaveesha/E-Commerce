<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Save User</title>
    <%@ include file="includes/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<a href="user.jsp" class="btn btn-secondary position-absolute top-40 m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to Users
</a>
<div class="container my-5">
    <h1 class="text-center mb-4">Save User</h1>
    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <form action="user-save" method="post" class="p-4 border rounded shadow-sm">
        <div class="mb-3">
            <label for="user_name" class="form-label">User Name</label>
            <input type="text" id="user_name" name="user_name" class="form-control" placeholder="Enter user name" required>
        </div>

        <div class="mb-3">
            <label for="user_email" class="form-label">User Email</label>
            <input type="email" id="user_email" name="user_email" class="form-control" placeholder="Enter user email" required>
        </div>

        <div class="mb-3">
            <label for="user_role" class="form-label">Role</label>
            <select id="user_role" name="user_role" class="form-control" required>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="user_password" class="form-label">Password</label>
            <input type="password" id="user_password" name="user_password" class="form-control" placeholder="Enter password" required>
        </div>

        <div class="mb-3">
            <label for="user_is_active" class="form-label">Active</label>
            <input type="checkbox" id="user_is_active" name="user_is_active" class="form-check-input">
            <label class="form-check-label" for="user_is_active">User is active</label>
        </div>

        <button type="submit" class="btn btn-primary w-100 mb-3">Save User</button>
    </form>

</div>

<%@ include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
