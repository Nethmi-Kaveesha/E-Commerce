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
    <title>Delete Category</title>
    <%@ include file="includes/head.jsp" %>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<a href="category.jsp" class="btn btn-secondary position-absolute top-40  m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to
</a>

<div class="container my-5">
    <h1 class="text-center mb-4">Delete Category</h1>

    <!-- Display Success Message -->
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

    <!-- Display Error Message -->
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

    <!-- Delete Category Form -->
    <form action="category-delete" method="post" class="border rounded p-4 shadow-sm">
        <div class="mb-3">
            <label for="category_id" class="form-label">Category ID:</label>
            <input type="number" id="category_id" name="category_id" class="form-control" placeholder="Enter Category ID" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-danger">Delete Category</button>
        </div>
    </form>
</div>

<%@ include file="includes/footer.jsp" %>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
