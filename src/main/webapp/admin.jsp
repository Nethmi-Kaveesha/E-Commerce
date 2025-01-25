<%@ page import="lk.ijse.ecommerceapp.model.User" %>

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
    </style>
</head>
<body>

<%@ include file="includes/navbar.jsp" %>
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
