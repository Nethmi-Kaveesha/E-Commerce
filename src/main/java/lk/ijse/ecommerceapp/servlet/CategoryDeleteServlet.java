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

@WebServlet(name = "CategoryDeleteServlet", value = "/category-delete")
public class CategoryDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("category_id");

        if (categoryId == null || categoryId.trim().isEmpty()) {
            resp.sendRedirect("category-delete.jsp?error=Category ID is required");
            return;
        }

        try (Connection connection = DataSourceFactory.getDataSource().getConnection()) {
            String sql = "DELETE FROM categories WHERE id = ?";
            try (PreparedStatement pstm = connection.prepareStatement(sql)) {
                pstm.setString(1, categoryId);

                int effectedRowCount = pstm.executeUpdate();

                if (effectedRowCount > 0) {
                    // Success
                    resp.sendRedirect("category-delete.jsp?message=Category deleted successfully");
                } else {
                    // Fail - category not found
                    resp.sendRedirect("category-delete.jsp?error=Category not found");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category-delete.jsp?error=Failed to delete category");
        }
    }
}
