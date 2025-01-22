<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="lk.ijse.ecommerceapp.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="lk.ijse.ecommerceapp.dao.OrderDao" %>
<%@ page import="lk.ijse.ecommerceapp.db.DBConnectionUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.model.Order" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf",dcf);
    User user = (User) request.getSession().getAttribute("user");
    List<Order> orders = null;
    if (user != null) {
        request.setAttribute("user", user);
        orders = new OrderDao(DBConnectionUtil.getConnection()).userOrders(user.getId());
    } else {
        response.sendRedirect("login.jsp");
    }

    ArrayList<Cart> cartArrayList = (ArrayList<Cart>)session.getAttribute("cart-list");
    if (cartArrayList != null) {
        request.setAttribute("cartList", cartArrayList);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Orders Page</title>
    <%@include file="includes/head.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container my-4">
    <h2 class="text-center mb-4">All Orders</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Cancel</th>
            </tr>
            </thead>
           <tbody>
                <%
                if (orders != null){
                    for (Order order : orders) {%>
                <tr>
                        <td><%= order.getDate()%></td>
                        <td><%= order.getName()%></td>
                        <td><%= order.getCategoryId()%></td>
                        <td><%= order.getQuantity()%></td>
                        <td><%= dcf.format(order.getPrice())%></td>
                    <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%= order.getOrderId() %>">Cancel</a> </td>
           </tr>
                <%}
                }
                    %>
           </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%@include file="includes/footer.jsp"%>
</body>
</html>
