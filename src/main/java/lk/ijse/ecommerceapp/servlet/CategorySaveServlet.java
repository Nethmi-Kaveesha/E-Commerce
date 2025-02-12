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

@WebServlet(name = "CategorySaveServlet", value = "/category-save")
public class CategorySaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("category_name");
        String categoryDescription = req.getParameter("category_description");

        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, categoryName);
            pstm.setString(2, categoryDescription);

            int effectedRowCount = pstm.executeUpdate();

            if (effectedRowCount > 0) {
                resp.sendRedirect("category-add.jsp?message=Category saved successfully");
            } else {
                resp.sendRedirect("category-add.jsp?error=Failed to save category");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category-add.jsp?error=Failed to save category");
        }
    }
}
