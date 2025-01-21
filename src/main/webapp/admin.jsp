<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return;  // Ensure no further processing happens after the redirect
    }
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <%@include file="includes/head.jsp"%>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .dashboard-button {
            width: 200px;
            height: 100px;
            font-size: 1.2rem;
            text-align: center;
        }
        .dashboard-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<!-- Main Content -->
<div class="container">
    <h2 class="text-center mb-4">Admin Dashboard</h2>

    <!-- Buttons for Main Functions -->
    <div class="dashboard-container">
        <!-- Button for Managing Users -->
        <a href="manage-users.jsp" class="btn btn-primary dashboard-button">
            <i class="fas fa-users"></i> Manage Users
        </a>

        <!-- Button for Managing Products -->
        <a href="manage-products.jsp" class="btn btn-success dashboard-button">
            <i class="fas fa-box"></i> Manage Products
        </a>

        <!-- Button for Viewing Orders -->
        <a href="view-orders.jsp" class="btn btn-warning dashboard-button">
            <i class="fas fa-shopping-cart"></i> View Orders
        </a>

        <!-- Button for Managing Categories -->
        <a href="manage-categories.jsp" class="btn btn-info dashboard-button">
            <i class="fas fa-tags"></i> Manage Categories
        </a>

        <!-- Button for Logout -->
        <a href="logout.jsp" class="btn btn-danger dashboard-button">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

</div>
<%@include file="includes/footer.jsp"%>
<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybKDsMZ5F+8aP3/sT2vXET1Owz5uXy5vY8jXfo5vKnFssITl5" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0xw2+Y99Vtk0q6Z1d1clt04vdlApYxT3YOwK8hA4Hqqkw0iQ" crossorigin="anonymous"></script>
</body>
</html>
