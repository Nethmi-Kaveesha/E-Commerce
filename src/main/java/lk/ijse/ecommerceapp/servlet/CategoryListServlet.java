package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.db.DataSourceFactory;
import lk.ijse.ecommerceapp.dto.CategoryDTO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryListServlet", value = "/category-list")
public class CategoryListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categoryList = new ArrayList<>();

        try (Connection connection = DataSourceFactory.getDataSource().getConnection()) {
            String sql = "SELECT * FROM categories";
            try (PreparedStatement pst = connection.prepareStatement(sql);
                 ResultSet rst = pst.executeQuery()) {
                while (rst.next()) {
                    CategoryDTO categoryDTO = new CategoryDTO(
                            rst.getInt("id"),
                            rst.getString("name"),
                            rst.getString("description")
                    );
                    categoryList.add(categoryDTO);
                }
            }

            req.setAttribute("categories", categoryList);

            RequestDispatcher rd = req.getRequestDispatcher("category-list.jsp");
            rd.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load categories.");
        }
    }
}
