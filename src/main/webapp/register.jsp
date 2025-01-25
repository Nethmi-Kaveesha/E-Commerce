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
  <title>User Registration</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="styles.css">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<div class="container my-5">
  <h2 class="text-center mb-4">User Registration</h2>

  <c:if test="${not empty message}">
    <div class="alert alert-success text-center">${message}</div>
  </c:if>
  <c:if test="${not empty error}">
    <div class="alert alert-danger text-center">${error}</div>
  </c:if>

  <form action="user-register-action" method="POST" class="border rounded p-4 shadow-sm">
    <div class="mb-3">
      <label for="user_name" class="form-label">Full Name:</label>
      <input type="text" id="user_name" name="user_name" class="form-control" placeholder="Enter your full name" required>
    </div>

    <div class="mb-3">
      <label for="user_email" class="form-label">Email Address:</label>
      <input type="email" id="user_email" name="user_email" class="form-control" placeholder="Enter your email" required>
    </div>

    <div class="mb-3">
      <label for="user_password" class="form-label">Password:</label>
      <input type="password" id="user_password" name="user_password" class="form-control" placeholder="Enter your password" required>
    </div>

    <div class="mb-3">
      <label for="user_role" class="form-label">Role:</label>
      <select id="user_role" name="user_role" class="form-select" required>
        <option value="admin">Admin</option>
        <option value="customer">Customer</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="user_is_active" class="form-label">Account Active:</label>
      <input type="checkbox" id="user_is_active" name="user_is_active">
    </div>

    <div class="mb-3 text-center">
      <button type="submit" class="btn btn-primary">Register</button>
    </div>
  </form>

  <p class="text-center">Already have an account? <a href="login.jsp">Login here</a></p>
</div>

<%@ include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
