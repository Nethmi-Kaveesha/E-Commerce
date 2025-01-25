<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page import="lk.ijse.ecommerceapp.dao.ProductDao" %>
<%@ page import="lk.ijse.ecommerceapp.db.DBConnectionUtil" %>
<%@ page import="lk.ijse.ecommerceapp.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%

    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

    ProductDao pd = new ProductDao(DBConnectionUtil.getConnection());
    List<Product> products = pd.getAllProducts();

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
    <title>Search Products</title>
    <%@ include file="includes/head.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-pzjw8f+ua7Kw1TIq0I61y2b2NXuaG4v7jzZs4zGsmT5+I+XoVXyHq2/xX2wqqw0c" crossorigin="anonymous">
    <style>

        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            background-color: #f9f9f9;
        }

        .product-card img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .product-card h4 {
            font-size: 18px;
            margin-top: 15px;
        }

        .product-card p {
            font-size: 16px;
            color: #333;
        }

        .product-card .btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <%
            String searchQuery = request.getParameter("query");
            String categoryId = request.getParameter("category");

            String productQuery = "SELECT * FROM products WHERE 1=1";

            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                productQuery += " AND name LIKE '%" + searchQuery + "%'";
            }

            if (categoryId != null && !categoryId.trim().isEmpty()) {
                productQuery += " AND category_id = " + categoryId;
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce", "root", "pass123");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(productQuery);

                while (rs.next()) {
                    String productName = rs.getString("name");
                    double productPrice = rs.getDouble("price");
                    String productImage = rs.getString("image");
                    int productId = rs.getInt("id");
        %>
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="product-card">
                <img src="product-image/<%= productImage %>" alt="<%= productName %>" class="img-fluid">
                <h4><%= productName %></h4>
                <p>$<%= productPrice %></p>
                <div class="mt-3 d-flex justify-content-between">
                    <a href="add-to-cart?id=<%= productId %>" class="btn btn-dark">Add to Cart</a>
                    <a href="order-now?quantity=1&id=<%= productId %>" class="btn btn-primary">Buy Now</a>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyFfh4vX3e3ZlZZM2BSCt0GZG+Pfw+J2J1fYtqX6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.5/dist/umd/popper.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0I61y2b2NXuaG4v7jzZs4zGsmT5+I+XoVXyHq2/xX2wqqw0c" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0I61y2b2NXuaG4v7jzZs4zGsmT5+I+XoVXyHq2/xX2wqqw0c" crossorigin="anonymous"></script>

</body>
</html>
