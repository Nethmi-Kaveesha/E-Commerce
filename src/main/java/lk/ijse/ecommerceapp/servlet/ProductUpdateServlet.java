package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.db.DataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "ProductUpdateServlet", value = "/product-update")
public class ProductUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("product_id");
        String name = req.getParameter("product_name");
        String description = req.getParameter("product_description");
        String price = req.getParameter("product_price");
        String stock = req.getParameter("product_stock");
        String image = req.getParameter("product_image");
        String categoryId = req.getParameter("category_id");

        // Get DataSource from DataSourceFactory
        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "UPDATE products SET name=?, description=?, price=?, image=?, category_id=?, stock=? WHERE id=?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, description);
            pstm.setDouble(3, Double.parseDouble(price));
            pstm.setString(4, image);
            pstm.setInt(5, Integer.parseInt(categoryId));
            pstm.setInt(6, Integer.parseInt(stock));
            pstm.setInt(7, Integer.parseInt(id));

            int effectedRowCount = pstm.executeUpdate();

            if (effectedRowCount > 0) {
                // success
                resp.sendRedirect("product-update.jsp?message=Product updated successfully");
            } else {
                // fail
                resp.sendRedirect("product-update.jsp?error=Failed to update product");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product-update.jsp?error=Failed to update product");
        }
    }
}
