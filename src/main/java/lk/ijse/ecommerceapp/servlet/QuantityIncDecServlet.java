package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.model.Cart;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        try {
            String action = req.getParameter("action");
            int id = Integer.parseInt(req.getParameter("id"));

            ArrayList<Cart> cartArrayList = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");

            if (cartArrayList == null) {
                cartArrayList = new ArrayList<>();
                req.getSession().setAttribute("cart-list", cartArrayList);
            }

            synchronized (cartArrayList) {
                if (action != null && id >= 1) {
                    if (action.equals("inc")) {
                        for (Cart cart : cartArrayList) {
                            if (cart.getId() == id) {
                                cart.setQuantity(cart.getQuantity() + 1);
                                break;
                            }
                        }
                    } else if (action.equals("dec")) {
                        for (Cart cart : cartArrayList) {
                            if (cart.getId() == id && cart.getQuantity() > 1) {
                                cart.setQuantity(cart.getQuantity() - 1);
                                break;
                            }
                        }
                    }
                }
            }

            resp.sendRedirect("cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
