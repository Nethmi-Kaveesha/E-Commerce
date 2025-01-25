package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.db.DataSourceFactory;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "ProductDeleteServlet", value = "/product-delete")
public class ProductDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("product_id");

        if (productId == null || productId.trim().isEmpty()) {
            resp.sendRedirect("product-delete.jsp?error=Product ID is required");
            return;
        }

        try (Connection connection = DataSourceFactory.getDataSource().getConnection()) {
            String sql = "DELETE FROM products WHERE id = ?";
            try (PreparedStatement pstm = connection.prepareStatement(sql)) {
                pstm.setString(1, productId);

                int effectedRowCount = pstm.executeUpdate();

                if (effectedRowCount > 0) {
                    resp.sendRedirect("product-delete.jsp?message=Product deleted successfully");
                } else {
                    resp.sendRedirect("product-delete.jsp?error=Product not found");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product-delete.jsp?error=Failed to delete product");
        }
    }
}
