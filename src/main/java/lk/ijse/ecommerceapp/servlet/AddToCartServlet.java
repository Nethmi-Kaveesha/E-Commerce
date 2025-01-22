package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.ecommerceapp.dao.ProductDao;
import lk.ijse.ecommerceapp.db.DBConnectionUtil;
import lk.ijse.ecommerceapp.model.Cart;
import lk.ijse.ecommerceapp.model.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        // Initialize ProductDao once to avoid creating it multiple times
        try {
            this.productDao = new ProductDao(DBConnectionUtil.getConnection());
        } catch (SQLException e) {
            throw new ServletException("Failed to initialize ProductDao", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        // Get the product ID from the request
        int id = Integer.parseInt(req.getParameter("id"));

        // Retrieve or initialize the session cart list
        HttpSession session = req.getSession();
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        // Check if the product already exists in the cart
        boolean exists = false;
        for (Cart c : cartList) {
            if (c.getId() == id) {
                exists = true;
                break;
            }
        }

        if (exists) {
            // If the product exists, redirect to the cart page
            resp.sendRedirect("cart.jsp");
        } else {
            // If the product does not exist, add it to the cart
            // Fetch product details from the database
            Product product = productDao.getProductById(id);

            if (product != null) {
                Cart cart = new Cart();
                cart.setId(id);
                cart.setQuantity(1);  // Default quantity is 1

                // Set the product details in the cart
                cart.setName(product.getName());
                cart.setPrice(product.getPrice());  // No need to convert to double
                cart.setCategoryId(product.getCategoryId());  // Keep the category ID in the cart

                // Add the cart item to the cart list
                cartList.add(cart);

                // Update the session with the new cart list
                session.setAttribute("cart-list", cartList);

                // Redirect to the cart page after adding the product
                resp.sendRedirect("index.jsp");
            } else {
                // Product not found, handle error gracefully
                resp.sendRedirect("error.jsp?message=Product%20not%20found");
            }
        }
    }
}