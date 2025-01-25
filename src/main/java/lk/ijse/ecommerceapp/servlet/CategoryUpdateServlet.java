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

@WebServlet(name = "CategoryUpdateServlet", value = "/category-update")
public class CategoryUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("category_id");
        String name = req.getParameter("category_name");
        String description = req.getParameter("category_description");

        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "UPDATE categories SET name=?, description=? WHERE id=?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, description);

            pstm.setInt(3, Integer.parseInt(id));

            int effectedRowCount = pstm.executeUpdate();

            if (effectedRowCount > 0) {
                resp.sendRedirect("category-update.jsp?message=Category updated successfully");
            } else {
                resp.sendRedirect("category-update.jsp?error=Failed to update category");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category-update.jsp?error=An error occurred while updating category");
        }
    }
}
