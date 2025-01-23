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

@WebServlet(name = "UserSaveServlet", value = "/user-save")
public class UserSaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("user_name");
        String userEmail = req.getParameter("user_email");
        String userRole = req.getParameter("user_role");
        String userPassword = req.getParameter("user_password");
        boolean userIsActive = req.getParameter("user_is_active") != null;

        // Get DataSource from the DataSourceFactory
        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO users (name, email, role, password, is_active) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, userName);
            pstm.setString(2, userEmail);
            pstm.setString(3, userRole);
            pstm.setString(4, userPassword);  // You may want to hash this password before saving
            pstm.setBoolean(5, userIsActive);

            // Execute the query and get the affected row count
            int effectedRowCount = pstm.executeUpdate();

            if (effectedRowCount > 0) {
                // Redirect with success message
                resp.sendRedirect("user-add.jsp?message=User saved successfully");
            } else {
                // Redirect with error message
                resp.sendRedirect("user-add.jsp?error=Failed to save user");
            }
        } catch (Exception e) {
            // Handle exceptions and redirect with an error message
            e.printStackTrace();
            resp.sendRedirect("user-add.jsp?error=Failed to save user");
        }
    }
}
