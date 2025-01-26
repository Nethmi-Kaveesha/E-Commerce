
<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="java.sql.*" %>

<%

    User user = (User) request.getSession().getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if (!user.getRole().equals("admin")) {
        response.sendRedirect("admindash.jsp");
        return;
    }


    Connection conn = null;
    Statement sta = null;
    ResultSet rss = null;

    int productCount = 0;
    int categoryCount = 0;
    int userCount = 0;
    int orderCount = 0;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce", "root", "pass123");

        String productQuery = "SELECT COUNT(*) FROM products";
        sta = conn.createStatement();
        rss = sta.executeQuery(productQuery);
        if (rss.next()) {
            productCount = rss.getInt(1);
        }

        String categoryQuery = "SELECT COUNT(*) FROM categories";
        rss = sta.executeQuery(categoryQuery);
        if (rss.next()) {
            categoryCount = rss.getInt(1);
        }

        // Query to count users
        String userQuery = "SELECT COUNT(*) FROM users";
        rss = sta.executeQuery(userQuery);
        if (rss.next()) {
            userCount = rss.getInt(1);
        }

        String orderQuery = "SELECT COUNT(*) FROM orders";
        rss = sta.executeQuery(orderQuery);
        if (rss.next()) {
            orderCount = rss.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rss != null) rss.close();
            if (sta != null) sta.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <%@ include file="includes/head.jsp" %>
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

        .stats {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .stat-card {
            background-color: #343a40;
            color: white;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            width: 200px;
        }

        .stat-card h4 {
            font-size: 1.2rem;
        }

        .stat-card p {
            font-size: 1.5rem;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<div class="container-fluid top-section">
    <div class="row align-items-center">
        <div id="logo" class="col-md-3 col-12 text-center text-md-start">
            <h1><span>T</span>rendify</h1>
        </div>
        <div class="col-md-9 col-12 text-center text-md-start">
            <form class="d-flex justify-content-center justify-content-md-start search-bar" action="search-products.jsp" method="GET">
                <input class="form-control" type="text" name="query" placeholder="Search products" aria-label="Search">

                <select class="form-control" name="category" aria-label="Category">
                    <option value="">Select Category</option>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce", "root", "pass123");
                            Statement st = con.createStatement();
                            String query = "SELECT id, name FROM categories";
                            ResultSet rs = st.executeQuery(query);

                            while (rs.next()) {
                                String categoryId = rs.getString("id");
                                String categoryName = rs.getString("name");
                    %>
                    <option value="<%= categoryId %>"><%= categoryName %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>

                <button class="btn btn-outline-light" type="submit">
                    <i class="fas fa-search"></i> Search
                </button>
            </form>
        </div>
    </div>
</div>
<h2>Welcome, Admin <%= user.getName() %></h2>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i> Cart<span class="badge badge-danger px-1">${cartList.size()}</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="shop.jsp">
                        <i class="fas fa-store"></i> Shop
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-th-large"></i> Categories
                    </a>
                    <ul class="dropdown-menu">
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useSSL=false", "root", "pass123");
                                Statement st = con.createStatement();
                                String query = "SELECT id, name FROM categories";
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
                                    String categoryId = rs.getString("id");
                                    String categoryName = rs.getString("name");
                        %>
                        <li class="dropdown-item">
                            <a href="/category?id=<%=categoryId%>"><%=categoryName%></a>
                        </li>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">
                        <i class="fas fa-envelope"></i> Contact Us
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="register.jsp">
                        <i class="fas fa-user-plus"></i> Register
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="admin.jsp">
                        <i class="fas fa-store"></i> Admin Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="orders.jsp">
                        <i class="fas fa-store"></i> Order Details
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="login.jsp">
                        <i class="fas fa-user"></i> Login
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h2>Welcome, Admin <%= user.getName() %></h2>
    <p>Today is <%= new java.util.Date() %></p>
    <h3>Dashboard Overview</h3>
    <div class="stats">
        <div class="stat-card">
            <h4>Products</h4>
            <p><%= productCount %></p>
        </div>
        <div class="stat-card">
            <h4>Categories</h4>
            <p><%= categoryCount %></p>
        </div>
        <div class="stat-card">
            <h4>Users</h4>
            <p><%= userCount %></p>
        </div>
        <div class="stat-card">
            <h4>Orders</h4>
            <p><%= orderCount %></p>
        </div>
    </div>
</div>

</body>
</html>
