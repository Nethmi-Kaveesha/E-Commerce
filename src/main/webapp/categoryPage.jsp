<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Category Page</title>
</head>
<body>

<h1>Category Details</h1>

<%
  String categoryId = request.getPathInfo().substring(1);
  Connection con = null;
  Statement st = null;
  ResultSet rs = null;
  try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce?useSSL=false", "root", "pass123");
    st = con.createStatement();

    String query = "SELECT * FROM categories WHERE id = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, categoryId);
    rs = ps.executeQuery();

    if (rs.next()) {
      String categoryName = rs.getString("name");
      String categoryDescription = rs.getString("description");
%>
<h2><%= categoryName %></h2>
<p><%= categoryDescription %></p>
<%
} else {
%>
<p>Category not found!</p>
<%
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (st != null) st.close();
      if (con != null) con.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>

</body>
</html>
