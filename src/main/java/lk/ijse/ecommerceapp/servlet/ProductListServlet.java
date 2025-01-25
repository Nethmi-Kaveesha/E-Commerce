package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.db.DataSourceFactory;
import lk.ijse.ecommerceapp.dto.ProductDTO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/product-list")
public class ProductListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> productList = new ArrayList<>();

        try (Connection connection = DataSourceFactory.getDataSource().getConnection()) {
            String sql = "SELECT * FROM products";
            try (PreparedStatement pst = connection.prepareStatement(sql);
                 ResultSet rst = pst.executeQuery()) {
                while (rst.next()) {
                    ProductDTO productDTO = new ProductDTO(
                            rst.getInt("id"),
                            rst.getString("name"),
                            rst.getDouble("price"),
                            rst.getString("image"),
                            rst.getInt("category_id")
                    );
                    productList.add(productDTO);
                }
            }

            req.setAttribute("products", productList);

            RequestDispatcher rd = req.getRequestDispatcher("product-list.jsp");
            rd.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load products.");
        }
    }
}
