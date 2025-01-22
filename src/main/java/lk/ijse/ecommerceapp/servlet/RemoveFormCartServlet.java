package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.model.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/remove-from-cart")
public class RemoveFormCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = resp.getWriter()) {
            String id = req.getParameter("id");
            if(id != null) {
                ArrayList<Cart> cartArrayList = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
                if(cartArrayList != null) {
                    for(Cart cart : cartArrayList) {
                        if (cart.getId()==Integer.parseInt(id)) {
                            cartArrayList.remove(cartArrayList.indexOf(cart));
                            break;
                        }
                    }

                    resp.sendRedirect("cart.jsp");
                }
            }else {
                resp.sendRedirect("cart.jsp");
            }
        }
    }
}
