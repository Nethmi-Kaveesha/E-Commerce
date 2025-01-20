<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="lk.ijse.ecommerceapp.dao.ProductDao" %>
<%@ page import="lk.ijse.ecommerceapp.db.DBConnectionUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
User user = (User) request.getSession().getAttribute("user");
if (user != null) {
    request.setAttribute("user", user);
    }

    ProductDao pd = new ProductDao(DBConnectionUtil.getConnection());
    List<Product> products = pd.getAllProducts();

%>
<!DOCTYPE html>

<html>
<head>
    <title>Welcome To Shopping Cart!</title>
    <%@include file="includes/head.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Link to FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container">
    <div class="card-header my-3">All Products</div>
    <div class="row">
        <%
        if (!products.isEmpty()){
            for (Product product : products) {%>
                 <div class="col-md-3">
            <div class="card w-100" style="width: 18rem;">
                <img src="product-image/1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="price">Price: $452</h6>
                    <h6 class="category">Category: some category</h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="#" class="btn btn-primary">Add to Cart</a>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
            <%}
        }
    %>

    </div>
</div>

<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
