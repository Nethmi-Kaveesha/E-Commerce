package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import lk.ijse.ecommerceapp.db.DataSourceFactory;

@WebServlet(name = "ProductSaveServlet", value = "/product-save")
public class ProductSaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get product details from the request
        String productName = req.getParameter("product_name");
        String productPrice = req.getParameter("product_price");
        String productImage = req.getParameter("product_image");  // Assuming you're passing the image filename or path
        String categoryId = req.getParameter("category_id");

        // Get DataSource from the DataSourceFactory
        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            // SQL query to insert product data into the products table
            String sql = "INSERT INTO products (name, price, image, category_id) VALUES (?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);

            // Set parameters for the SQL query
            pstm.setString(1, productName);
            pstm.setString(2, productPrice);  // You may want to parse this as a float or double if required
            pstm.setString(3, productImage);
            pstm.setString(4, categoryId);

            // Execute the query and get the affected row count
            int effectedRowCount = pstm.executeUpdate();

            if (effectedRowCount > 0) {
                // Redirect with success message
                resp.sendRedirect("product-add.jsp?message=Product saved successfully");
            } else {
                // Redirect with error message
                resp.sendRedirect("product-add.jsp?error=Failed to save product");
            }
        } catch (Exception e) {
            // Handle exceptions and redirect with an error message
            e.printStackTrace();
            resp.sendRedirect("product-add.jsp?error=Failed to save product");
        }
    }
}
