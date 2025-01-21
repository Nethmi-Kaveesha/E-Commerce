<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lk.ijse.ecommerceapp.model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.dao.ProductDao" %>
<%@ page import="lk.ijse.ecommerceapp.db.DBConnectionUtil" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
         request.setAttribute("user", user);
    }

    ArrayList<Cart> cartArrayList = (ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartList = null;
    if (cartArrayList != null) {
        ProductDao productDao = new ProductDao(DBConnectionUtil.getConnection());
        cartList = productDao.getCartProducts(cartArrayList);
        request.setAttribute("cartList", cartArrayList);
    }

%><!DOCTYPE html>
<html>
<head>
    <title>Cart Page</title>
    <%@include file="includes/head.jsp"%>
    <style>
        .table tbody td{
            vertical-align:middle;
        }

        .btn-incre, .btn-decre{
            box-shadow: none;
            font-size: 45px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="d-flex py-3"><h3>Total Price: $ 452</h3><a class="mx-3 btn btn-primary" href="#">Check OutS</a></div>
    <table class="table table-loght">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Buy Now</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (cartArrayList != null){
            for (Cart c : cartList){%>
                 <tr>
            <td><%= c.getName()%></td>
            <td><%= c.getCategoryId()%></td>
            <td><%= c.getPrice()%></td>
            <td>
                <form action="" method="post" class="form-inline">
                    <input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
                    <div class="form-group d-flex justify-content-between">
                        <a class="btn btn-sm btn-incre" href=""><i class="fas fa-plus-square"></i></a>
                        <input type="text" name="quantity" class="form-control" value="1" readonly>
                        <a class="btn btn-sm btn-decre" href=""><i class="fas fa-minus-square"></i></a>
                    </div>
                </form>
            </td>
            <td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
        </tr>
           <% }
        }
        %>

        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%@include file="includes/footer.jsp"%>
</body>
</html>