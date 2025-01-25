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
        String price = req.getParameter("product_price");
        String image = req.getParameter("product_image");
        String categoryId = req.getParameter("product_category_id");

        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "UPDATE products SET name=?, price=?, image=?, category_id=? WHERE id=?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setDouble(2, Double.parseDouble(price));
            pstm.setString(3, image);

            if (categoryId == null || categoryId.isEmpty()) {
                pstm.setNull(4, java.sql.Types.INTEGER);
            } else {
                pstm.setInt(4, Integer.parseInt(categoryId));
            }

            pstm.setInt(5, Integer.parseInt(id));

            int effectedRowCount = pstm.executeUpdate();

            if (effectedRowCount > 0) {
                resp.sendRedirect("product-update.jsp?message=Product updated successfully");
            } else {
                resp.sendRedirect("product-update.jsp?error=Failed to update product");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product-update.jsp?error=An error occurred while updating product");
        }
    }
}
