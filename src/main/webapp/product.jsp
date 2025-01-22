<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>Product Management System</title>
    <%@ include file="includes/head.jsp" %> <!-- Include header from a separate file -->
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
            background-color: #007bff;
            padding: 15px 30px;
            border-radius: 50px;
            margin: 10px;
            font-size: 1.2rem;
            display: inline-block;
            width: 220px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .links a:hover {
            background-color: #0056b3;
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
<%@ include file="includes/navbar.jsp" %> <!-- Include navbar from a separate file -->


<!-- Main Content Section -->
<div class="container">
    <h1>Product Management System</h1>

    <div class="links">
        <a href="product-add.jsp" class="btn btn-primary">Add New Product</a>
        <a href="product-list" class="btn btn-info">View All Products</a>
        <a href="product-delete.jsp" class="btn btn-danger">Delete Product</a>
        <a href="product-update.jsp" class="btn btn-warning">Update Product</a>
    </div>
</div>

<%@ include file="includes/footer.jsp" %> <!-- Include footer from a separate file -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
