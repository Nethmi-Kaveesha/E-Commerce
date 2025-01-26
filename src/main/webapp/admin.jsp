<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <%@ include file="includes/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        .card-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 50px;
            flex-wrap: wrap;
        }

        .dashboard-card {
            width: 18rem;
            text-align: center;
            margin-bottom: 20px;
            background-color: dimgrey;
            border: 2px solid orange;
            color: white;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }

        .dashboard-card i {
            font-size: 3rem;
            margin-top: 20px;
        }

        .dashboard-card .card-body {
            padding: 20px;
        }

        .dashboard-card .card-body h5 {
            font-size: 1.5rem;
            margin: 10px 0;
        }

        .view-details-button {
            width: 140px;
            height: 50px;
            font-size: 0.875rem;
            text-align: center;
            background-color: orange !important;
            font-weight: bold;
            text-decoration: none;
            border-radius: 10px;
            margin-top: 10px;
            padding: 5px 0;
            color: white;
        }


        .view-details-button i {
            font-size: 1rem;
            color: white;
        }

        .view-details-button:hover {
            background-color: orangered;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .form-control {
            width: 220px;
            padding: 5px;
            font-size: 0.9rem;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            padding: 5px 10px;
            font-size: 0.9rem;
            border-radius: 5px;
        }

        button i {
            margin-right: 5px;
        }

        @media (max-width: 768px) {
            .form-control {
                width: 220px;
            }
            .btn {
                padding: 4px 8px;
                font-size: 0.8rem;
            }
        }

        .top-section {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }

        #logo h1 {
            font-family: "Britannic Bold", sans-serif;
            font-size: 2.5rem;
            color: white;
            margin: 0;
            position: relative;
            right: -20px;
            text-transform: capitalize;
        }

        #logo h1 span:first-child {
            color: #ff8c00;
        }

        .navbar-brand img {
            width: 200px;
            height: 70px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            border: 3px solid #ffffff;
            border-radius: 8px;
        }

        .navbar-brand img:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        .search-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            justify-content: center;
        }

        .search-bar input {
            width: 420px;
            padding: 5px 10px;
            border-radius: 15px;
            border: 1px solid #ccc;
            font-size: 0.9rem;
        }

        .search-bar button {
            margin-left: 20px;
            width: 200px;
            border-radius: 25px;
            background-color: #ff8c00;
            color: white;
            padding: 6px 15px;
            border: none;
            transition: background-color 0.3s;
        }

        .search-bar button:hover {
            background-color: #e67e00;
        }

        .navbar {
            background-color: #343a40;
            margin-top: 20px;
        }

        .navbar-nav {
            display: flex;
            justify-content: space-around;
            width: 100%;
        }

        .nav-link {
            color: white !important;
            font-size: 1.1rem;
        }

        .nav-link:hover {
            color: #ff8c00 !important;
        }

        .nav-item {
            position: relative;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0;
            margin: 0;
            list-style: none;
            z-index: 1000;
        }

        .nav-item:hover .dropdown-menu {
            display: block;
        }

        .dropdown-item {
            padding: 10px 15px;
            border-bottom: 1px solid #f0f0f0;
        }

        .dropdown-item:last-child {
            border-bottom: none;
        }

        .dropdown-item a {
            color: #333;
            text-decoration: none;
        }

        .dropdown-item a:hover {
            color: #007bff;
        }

    </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <h2 class="text-center mb-4">Admin Dashboard</h2>
    <div class="card-container">
        <div class="card dashboard-card">
            <i class="fas fa-users"></i>
            <div class="card-body">
                <h5 class="card-title">Manage Users</h5>
                <a href="user.jsp" class="btn view-details-button">
                    <i class="fas fa-info-circle"></i> View Details
                </a>
            </div>
        </div>

        <div class="card dashboard-card">
            <i class="fas fa-box"></i>
            <div class="card-body">
                <h5 class="card-title">Manage Products</h5>
                <a href="product.jsp" class="btn view-details-button">
                    <i class="fas fa-info-circle"></i> View Details
                </a>
            </div>
        </div>

        <div class="card dashboard-card">
            <i class="fas fa-shopping-cart"></i>
            <div class="card-body">
                <h5 class="card-title">View Orders</h5>
                <a href="orders.jsp" class="btn view-details-button">
                    <i class="fas fa-info-circle"></i> View Details
                </a>
            </div>
        </div>

        <div class="card dashboard-card">
            <i class="fas fa-tags"></i>
            <div class="card-body">
                <h5 class="card-title">Manage Categories</h5>
                <a href="category.jsp" class="btn view-details-button">
                    <i class="fas fa-info-circle"></i> View Details
                </a>
            </div>
        </div>

        <div class="card dashboard-card">
            <i class="fas fa-sign-out-alt"></i>
            <div class="card-body">
                <h5 class="card-title">Logout</h5>
                <a href="logout.jsp" class="btn btn-warning">Logout</a>
            </div>
        </div>

    </div>
</div>

<%@ include file="includes/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybKDsMZ5F+8aP3/sT2vXET1Owz5uXy5vY8jXfo5vKnFssITl5" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0xw2+Y99Vtk0q6Z1d1clt04vdlApYxT3YOwK8hA4Hqqkw0iQ" crossorigin="anonymous"></script>

</body>
</html>
