<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="lk.ijse.ecommerceapp.dao.ProductDao" %>
<%@ page import="lk.ijse.ecommerceapp.db.DBConnectionUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.model.Product" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="lk.ijse.ecommerceapp.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

    ProductDao pd = new ProductDao(DBConnectionUtil.getConnection());
    List<Product> products = pd.getAllProducts();

    ArrayList<Cart> cartArrayList = (ArrayList<Cart>)session.getAttribute("cart-list");
    if (cartArrayList != null) {
        request.setAttribute("cartList", cartArrayList);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome To Shopping Cart!</title>
    <%@ include file="includes/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Link to FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<h2>Welcome, ${name}!</h2>
<p>Your role is: ${role}</p>
<a href="login.jsp">Logout</a>
<div class="container">
    <div class="card-header my-3">All Products</div>
    <div class="row">
        <%
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
        <div class="col-md-3 my-3">
            <div class="card w-100" style="width: 18rem;">
                <img src="product-image/<%= product.getImage() %>" class="card-img-top" alt="<%= product.getName() %>">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <h6 class="price">₹ <%= product.getPrice().setScale(2, BigDecimal.ROUND_HALF_UP).toString() %></h6> <!-- Price formatting -->
                    <h6 class="category">Category: <%= product.getCategoryId() %></h6> <!-- Displaying Category ID; update if category names are available -->
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="add-to-cart?id=<%= product.getId() %>" class="btn btn-dark">Add to Cart</a>
                        <a href="order-now?quantity=1&id=<%=product.getId()%>" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="alert alert-warning" role="alert">
            No products available at the moment.
        </div>
        <%
            }
        %>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
