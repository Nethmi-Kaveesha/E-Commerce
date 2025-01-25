<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.model.Product" %>

<html>
<head>
    <title>Category Products</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Products in this Category</h1>
<div class="product-list">
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (Product product : products) {
    %>
    <div class="product">
        <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
        <h2><%= product.getName() %></h2>
        <p>Price: $<%= product.getPrice() %></p>
    </div>
    <%
        }
    } else {
    %>
    <p>No products found for this category.</p>
    <%
        }
    %>
</div>
</body>
</html>
