<%@ page import="lk.ijse.ecommerceapp.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Save Category</title>
    <%@ include file="includes/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<a href="category.jsp" class="btn btn-secondary position-absolute top-40  m-3" style="right: 110px;">
    <i class="fas fa-arrow-left"></i> Back to
</a>
<div class="container my-5">
    <h1 class="text-center mb-4">Save Category</h1>
    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>

    <form action="category-save" method="post" class="p-4 border rounded shadow-sm">
        <div class="mb-3">
            <label for="category_name" class="form-label">Category Name</label>
            <input type="text" id="category_name" name="category_name" class="form-control" placeholder="Enter category name" required>
        </div>

        <div class="mb-3">
            <label for="category_description" class="form-label">Category Description</label>
            <input type="text" id="category_description" name="category_description" class="form-control" placeholder="Enter category description" required>
        </div>

        <button type="submit" class="btn btn-primary w-100 mb-3">Save Category</button>
    </form>

</div>

<%@ include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
