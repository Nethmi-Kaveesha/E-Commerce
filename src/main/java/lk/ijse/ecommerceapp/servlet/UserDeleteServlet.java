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

@WebServlet(name = "UserDeleteServlet", value = "/user-delete")
public class UserDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("user_id");

        if (userId == null || userId.trim().isEmpty()) {
            resp.sendRedirect("user-delete.jsp?error=User ID is required");
            return;
        }

        try (Connection connection = DataSourceFactory.getDataSource().getConnection()) {
            String sql = "DELETE FROM users WHERE id = ?";
            try (PreparedStatement pstm = connection.prepareStatement(sql)) {
                pstm.setString(1, userId);

                int effectedRowCount = pstm.executeUpdate();

                if (effectedRowCount > 0) {
                    // Success - user deleted
                    resp.sendRedirect("user-delete.jsp?message=User deleted successfully");
                } else {
                    // Fail - user not found
                    resp.sendRedirect("user-delete.jsp?error=User not found");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("user-delete.jsp?error=Failed to delete user");
        }
    }
}
