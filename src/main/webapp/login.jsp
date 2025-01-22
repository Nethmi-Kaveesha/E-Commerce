<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="lk.ijse.ecommerceapp.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return; // Prevent further execution
    }

    ArrayList<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cartArrayList != null) {
        request.setAttribute("cartList", cartArrayList);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart Login</title>

    <!-- External Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 500px;
            margin-top: 80px;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-decoration: underline;
            text-align: center;
            color: dimgrey;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: darkslategrey;
            border: none;
        }

        .form-text {
            font-size: 0.85rem;
            color: #6c757d;
        }

        .text-center a {
            color: dimgray;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<!-- Include Navbar -->
<%@ include file="includes/navbar.jsp" %>

<!-- Main Container -->
<div class="container">
    <h2>Login</h2>

    <!-- Login Form -->
    <form action="user-login" method="post">
        <!-- Email Field -->
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>

        <!-- Password Field -->
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                    ${errorMessage}
            </div>
        </c:if>

        <!-- Submit Button -->
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">Login</button>
        </div>

        <!-- Register Link -->
        <div class="text-center mt-3">
            <a href="register.jsp">Don't have an account? Register here</a>
        </div>
    </form>
</div>

<!-- External Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!-- Include Footer -->
<%@ include file="includes/footer.jsp" %>
</body>
</html>
