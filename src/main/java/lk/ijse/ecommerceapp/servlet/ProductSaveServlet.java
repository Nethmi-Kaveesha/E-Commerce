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
        String productName = req.getParameter("product_name");
        String productPrice = req.getParameter("product_price");
        String productImage = req.getParameter("product_image");
        String categoryId = req.getParameter("category_id");

        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO products (name, price, image, category_id) VALUES (?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);

            pstm.setString(1, productName);
            pstm.setString(2, productPrice);
            pstm.setString(3, productImage);
            pstm.setString(4, categoryId);

            int effectedRowCount = pstm.executeUpdate();

            if (effectedRowCount > 0) {
                resp.sendRedirect("product-add.jsp?message=Product saved successfully");
            } else {
                resp.sendRedirect("product-add.jsp?error=Failed to save product");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product-add.jsp?error=Failed to save product");
        }
    }
}
