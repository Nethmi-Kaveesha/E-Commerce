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
        resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Please fill in all fields!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        try (Connection con = DataSourceFactory.getDataSource().getConnection()) {
            UserDao userDao = new UserDao(con);
            User user = userDao.userLogin(email, password);

            if (user != null) {
                // Get the current session, or create a new session if it doesn't exist
                HttpSession session = req.getSession(false); // Use false to prevent creating a new session if it doesn't exist
                if (session == null) {
                    session = req.getSession(); // Create a new session
                }

                // Check if the session already has the user attribute
                if (session.getAttribute("user") == null) {
                    session.setAttribute("user", user); // Set the user session variable
                }

                // Redirect based on user role
                if ("admin".equals(user.getRole())) {
                    resp.sendRedirect("admindash.jsp");  // Admin Dashboard
                } else {
                    resp.sendRedirect("customer.jsp");  // Customer Dashboard
                }
            } else {
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
