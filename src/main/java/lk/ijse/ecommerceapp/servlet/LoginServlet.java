package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.ecommerceapp.dao.UserDao;
import lk.ijse.ecommerceapp.db.DataSourceFactory;
import lk.ijse.ecommerceapp.model.User;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp"); // Redirect to the login page
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Set the response content type
        resp.setContentType("text/html;charset=UTF-8");

        // Retrieve email and password from the request
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Input validation
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Please fill in all fields!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // Database operations
        try (Connection con = DataSourceFactory.getDataSource().getConnection()) {
            UserDao userDao = new UserDao(con);

            // Authenticate user
            User user = userDao.userLogin(email, password);

            if (user != null) {
                // Successful login
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect("cart.jsp"); // Redirect to dashboard
            } else {
                // Failed login
                req.setAttribute("errorMessage", "Invalid email or password! Please try again.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred. Please try again later.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
