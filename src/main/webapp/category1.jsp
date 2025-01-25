<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Details</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            text-align: center;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #4CAF50;
        }

        p {
            font-size: 1rem;
            line-height: 1.6;
        }

        .category-info {
            margin-top: 20px;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #222;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .not-found {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
<header>
    <h1>Category Details</h1>
</header>

<main>
    <section class="category-info">
        <h2>Category Information</h2>
        <%
            lk.ijse.ecommerceapp.model.Category category = (lk.ijse.ecommerceapp.model.Category) request.getAttribute("category");
            if (category != null) {
        %>
        <p><strong>Category ID:</strong> <%= category.getId() %></p>
        <p><strong>Category Name:</strong> <%= category.getName() %></p>
        <p><strong>Description:</strong> <%= category.getDescription() != null ? category.getDescription() : "No description available." %></p>
        <%
        } else {
        %>
        <p class="not-found">Category not found. Please check the category ID.</p>
        <%
            }
        %>
    </section>
</main>

<footer>
    <p>&copy; 2025 E-Commerce App. All Rights Reserved.</p>
</footer>
</body>
</html>
