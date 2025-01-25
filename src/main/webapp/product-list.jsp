<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.dto.ProductDTO" %>
<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <title>Product List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<a href="product.jsp" class="btn btn-secondary position-absolute top-40 m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to Product Management
</a>

<div class="container mt-5">
    <h1 class="text-center mb-4">Product List</h1>

    <%

        List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("products");

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
            for (ProductDTO product : productList) {
        %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getPrice() %></td>
            <td>
                <%
                    String imagePath = product.getImage();
                    if (imagePath == null || imagePath.isEmpty()) {
                        imagePath = "product-image/1.jpg";
                    } else {
                        imagePath = "product-image/" + imagePath;
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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
