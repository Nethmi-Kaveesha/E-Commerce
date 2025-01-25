package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.dao.UserDao;
import lk.ijse.ecommerceapp.model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Timestamp;

@WebServlet("/user-register-action")
public class UserRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("user_name");
        String userEmail = request.getParameter("user_email");
        String userPassword = request.getParameter("user_password");
        String userRole = request.getParameter("user_role");
        boolean userIsActive = "on".equals(request.getParameter("user_is_active"));

        if (userName == null || userEmail == null || userPassword == null || userRole == null) {
            request.setAttribute("error", "Please fill in all fields.");
            request.getRequestDispatcher("user-register.jsp").forward(request, response);
            return;
        }

        User newUser = new User();
        newUser.setName(userName);
        newUser.setEmail(userEmail);
        newUser.setPassword(userPassword);
        newUser.setRole(userRole);
        newUser.setActive(userIsActive);
        newUser.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        newUser.setUpdatedAt(new Timestamp(System.currentTimeMillis()));

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "pass123")) {
            UserDao userDAO = new UserDao(con);
            boolean isRegistered = userDAO.saveUser(newUser);

            if (isRegistered) {
                request.setAttribute("message", "User registered successfully!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during registration. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
