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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "UserUpdateServlet", value = "/user-update")
public class UserUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("user_id");
        String name = req.getParameter("user_name");
        String email = req.getParameter("user_email");
        String role = req.getParameter("user_role");
        String isActive = req.getParameter("user_is_active");
        String password = req.getParameter("user_password");

        // Debugging: log input parameters
        System.out.println("Received parameters: id=" + id + ", name=" + name + ", email=" + email + ", role=" + role);

        DataSource dataSource = DataSourceFactory.getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            // Check if user exists before updating
            String sqlCheck = "SELECT COUNT(*) FROM users WHERE id=?";
            try (PreparedStatement stmt = connection.prepareStatement(sqlCheck)) {
                stmt.setInt(1, Integer.parseInt(id));
                ResultSet rs = stmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    // User exists, proceed with the update
                    String sql = "UPDATE users SET name=?, email=?, role=?, is_active=?, password=? WHERE id=?";
                    try (PreparedStatement pstm = connection.prepareStatement(sql)) {
                        pstm.setString(1, name);
                        pstm.setString(2, email);
                        pstm.setString(3, role);
                        pstm.setBoolean(4, "on".equals(isActive));
                        pstm.setString(5, password);
                        pstm.setInt(6, Integer.parseInt(id));

                        int effectedRowCount = pstm.executeUpdate();
                        System.out.println("Rows affected: " + effectedRowCount);

                        if (effectedRowCount > 0) {
                            resp.sendRedirect("user-edit.jsp?message=User updated successfully");
                        } else {
                            resp.sendRedirect("user-edit.jsp?error=Failed to update user");
                        }
                    }
                } else {
                    resp.sendRedirect("user-edit.jsp?error=User not found");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("user-edit.jsp?error=SQL Error occurred: " + e.getMessage());
        }
    }
}
