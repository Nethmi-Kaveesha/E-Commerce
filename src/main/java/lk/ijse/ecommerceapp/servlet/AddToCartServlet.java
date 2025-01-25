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
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        try {
            this.productDao = new ProductDao(DBConnectionUtil.getConnection());
        } catch (SQLException e) {
            throw new ServletException("Failed to initialize ProductDao", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        boolean exists = false;
        for (Cart c : cartList) {
            if (c.getId() == id) {
                exists = true;
                break;
            }
        }

        if (exists) {
            resp.sendRedirect("cart.jsp");
        } else {
            Product product = productDao.getProductById(id);

            if (product != null) {
                Cart cart = new Cart();
                cart.setId(id);
                cart.setQuantity(1);

                cart.setName(product.getName());
                cart.setPrice(product.getPrice());
                cart.setCategoryId(product.getCategoryId());

                cartList.add(cart);

                session.setAttribute("cart-list", cartList);

                String referer = req.getHeader("referer");
                if (referer == null || referer.isEmpty()) {
                    referer = "index.jsp";
                }

                resp.sendRedirect(referer);
            } else {
                resp.sendRedirect("error.jsp?message=Product%20not%20found");
            }
        }
    }
}
