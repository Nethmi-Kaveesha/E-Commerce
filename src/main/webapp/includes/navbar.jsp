<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    User user = (User) request.getSession();
    String userRole = (String) session.getAttribute("role"); // Retrieve the user's role from session
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
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

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shop.jsp"><i class="fas fa-store"></i> Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
                </li>

                <% if ("admin".equals(userRole)) { %>
                <!-- Admin Navigation -->
                <li class="nav-item">
                    <a class="nav-link" href="orders.jsp"><i class="fas fa-list"></i> Manage Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp"><i class="fas fa-tools"></i> Admin Dashboard</a>
                </li>
                <% } else if ("customer".equals(userRole)) { %>
                <!-- Customer Navigation -->
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp"><i class="fas fa-user"></i> My Profile</a>
                </li>
                <% } %>

                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><i class="fas fa-user"></i> Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>
