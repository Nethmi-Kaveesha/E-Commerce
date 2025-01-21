package lk.ijse.ecommerceapp.servlet;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.dto.CategoryDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryListServlet", value = "/category-list")
public class CategoryListServlet extends HttpServlet {

    private static HikariDataSource dataSource;

    @Override
    public void init() throws ServletException {
        // Initialize connection pool
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/ecommerce");
        config.setUsername("root");
        config.setPassword("pass123");
        config.setMaximumPoolSize(10); // Set the maximum pool size

        dataSource = new HikariDataSource(config);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categoryList = new ArrayList<>();

        // Get the database connection from the pool
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM categories";
            try (PreparedStatement pst = connection.prepareStatement(sql);
                 ResultSet rst = pst.executeQuery()) {

                // Process the result set
                while (rst.next()) {
                    CategoryDTO categoryDTO = new CategoryDTO(
                            rst.getInt("id"),
                            rst.getString("name"),
                            rst.getString("description")
                    );
                    categoryList.add(categoryDTO);
                }
            }

            // Attach the category list to the request object
            req.setAttribute("categories", categoryList);

            // Forward to JSP page for rendering
            RequestDispatcher rd = req.getRequestDispatcher("category-list.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category-list.jsp?error=Failed to load categories");
        }
    }

    @Override
    public void destroy() {
        // Close the data source when the servlet is destroyed
        if (dataSource != null) {
            dataSource.close();
        }
    }
}
