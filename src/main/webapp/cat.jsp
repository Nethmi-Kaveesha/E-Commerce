<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Products</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Products in Category</h1>

<h2>Category: ${categoryName}</h2>

<c:choose>
    <c:when test="${not empty products}">
        <div class="product-list">
            <c:forEach var="product" items="${products}">
                <div class="product-item">
                    <img src="images/${product.image}" alt="${product.name}">
                    <h3>${product.name}</h3>
                    <p>Price: $${product.price}</p>
                </div>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <p>No products available in this category.</p>
    </c:otherwise>
</c:choose>
</body>
</html>
