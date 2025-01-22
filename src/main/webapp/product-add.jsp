<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Check if the user is logged in
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return; // Ensure no further processing happens after the redirect
    }
%>
<html>
<head>
    <title>Save Product</title>
    <%@ include file="includes/head.jsp" %>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<a href="product.jsp" class="btn btn-secondary position-absolute top-40 m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to
</a>
<div class="container my-5">
    <h1 class="text-center mb-4">Save Product</h1>

    <!-- Success Message -->
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

    <!-- Error Message -->
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

    <!-- Product Form -->
    <form action="product-save" method="post" class="p-4 border rounded shadow-sm">
        <div class="mb-3">
            <label for="product_name" class="form-label">Product Name</label>
            <input type="text" id="product_name" name="product_name" class="form-control" placeholder="Enter product name" required>
        </div>

        <div class="mb-3">
            <label for="product_price" class="form-label">Product Price</label>
            <input type="text" id="product_price" name="product_price" class="form-control" placeholder="Enter product price" required>
        </div>

        <div class="mb-3">
            <label for="product_image" class="form-label">Product Image</label>
            <input type="text" id="product_image" name="product_image" class="form-control" placeholder="Enter product image (file name or path)" required>
        </div>

        <div class="mb-3">
            <label for="category_id" class="form-label">Category ID</label>
            <input type="text" id="category_id" name="category_id" class="form-control" placeholder="Enter category ID" required>
        </div>

        <button type="submit" class="btn btn-primary w-100 mb-3">Save Product</button>
    </form>

</div>

<%@ include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
