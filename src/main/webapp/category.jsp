<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP - Category Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }

        .links {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        @media (min-width: 600px) {
            .links {
                flex-direction: row;
            }
        }
    </style>
</head>
<body>
<h1><%= "Category Management System" %></h1>
<div class="links">
    <a href="category-add.jsp">Add New Category</a>
    <a href="category-list">View All Categories</a>
    <a href="category-delete.jsp">Delete Category</a>
    <a href="category-update.jsp">Update Category</a>
</div>

</body>
</html>
