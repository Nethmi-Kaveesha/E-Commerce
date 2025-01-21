<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.dto.CategoryDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category List</title>
</head>
<body>
<h1>Category List</h1>

<%
    // Retrieve the category list from the request object
    List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categories");

    // Check if the list is not null and not empty
    if (dataList != null && !dataList.isEmpty()) {
%>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <%
        // Loop through each category and display in table rows
        for (CategoryDTO categoryDTO : dataList) {
    %>
    <tr>
        <td><%= categoryDTO.getId() %></td>
        <td><%= categoryDTO.getName() %></td>
        <td><%= categoryDTO.getDescription() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
} else {
%>
<p>No categories found.</p>
<%
    }
%>

</body>
</html>
