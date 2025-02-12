package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.db.DataSourceFactory;
import lk.ijse.ecommerceapp.dto.UserDTO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserListServlet", value = "/user-list")
public class UserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserDTO> userList = new ArrayList<>();

        try (Connection connection = DataSourceFactory.getDataSource().getConnection()) {
            String sql = "SELECT * FROM users";
            try (PreparedStatement pst = connection.prepareStatement(sql);
                 ResultSet rst = pst.executeQuery()) {
                while (rst.next()) {
                    UserDTO userDTO = new UserDTO(
                            rst.getInt("id"),
                            rst.getString("name"),
                            rst.getString("email"),
                            rst.getString("role"),
                            rst.getBoolean("is_active"),
                            rst.getString("password")
                    );
                    userList.add(userDTO);
                }
            }

            req.setAttribute("users", userList);

            RequestDispatcher rd = req.getRequestDispatcher("UserList.jsp");
            rd.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load users.");
        }
    }
}
