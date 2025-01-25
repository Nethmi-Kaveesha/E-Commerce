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
    <title>Update Product</title>
    <%@ include file="includes/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<a href="products.jsp" class="btn btn-secondary position-absolute top-40 m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to
</a>

<div class="container my-5">
    <h1 class="text-center mb-4">Update Product</h1>
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

    <form action="product-update" method="post" class="border rounded p-4 shadow-sm">
        <div class="mb-3">
            <label for="id" class="form-label">Product ID</label>
            <input type="text" id="id" name="product_id" class="form-control" placeholder="Enter Product ID" required>
        </div>

        <div class="mb-3">
            <label for="name" class="form-label">Product Name</label>
            <input type="text" id="name" name="product_name" class="form-control" placeholder="Enter Product Name" required>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Product Price</label>
            <input type="number" step="0.01" id="price" name="product_price" class="form-control" placeholder="Enter Product Price" required>
        </div>

        <div class="mb-3">
            <label for="image" class="form-label">Product Image URL</label>
            <input type="text" id="image" name="product_image" class="form-control" placeholder="Enter Product Image URL" required>
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">Category ID</label>
            <input type="text" id="category" name="product_category_id" class="form-control" placeholder="Enter Category ID">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Update Product</button>
        </div>
    </form>
</div>

<%@ include file="includes/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
