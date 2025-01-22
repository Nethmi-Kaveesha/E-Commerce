<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.dto.ProductDTO" %>
<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Check if the user is logged in, if so, redirect them
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return; // Ensure no further processing happens after the redirect
    }
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<!-- Button to go back to Product Management, with Font Awesome icon -->
<a href="product.jsp" class="btn btn-secondary position-absolute top-40 m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to Product Management
</a>

<div class="container mt-5">
    <h1 class="text-center mb-4">Product List</h1>

    <%
        // Retrieve the product list from the request attribute
        List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("products");

        // Check if the list is empty or null
        if (productList != null && !productList.isEmpty()) {
    %>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Image</th>
            <th>Category ID</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Iterate through the list of products and display them
            for (ProductDTO product : productList) {
        %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getPrice() %></td>
            <td>
                <%
                    // Check if the product has an image
                    String imagePath = product.getImage();
                    if (imagePath == null || imagePath.isEmpty()) {
                        imagePath = "product-image/1.jpg"; // Default image if no image is found
                    } else {
                        imagePath = "product-image/" + imagePath; // Product-specific image path
                    }
                %>
                <img src="<%= imagePath %>" alt="Product Image" width="100" height="100">
            </td>
            <td><%= product.getCategoryId() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p class="text-center text-danger">No products available.</p>
    <%
        }
    %>
</div>

<%@ include file="includes/footer.jsp" %>

<!-- Bootstrap JS and Popper.js (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
