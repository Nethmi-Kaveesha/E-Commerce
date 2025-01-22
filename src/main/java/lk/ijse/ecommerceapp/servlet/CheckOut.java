package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.dao.OrderDao;
import lk.ijse.ecommerceapp.db.DBConnectionUtil;
import lk.ijse.ecommerceapp.model.Cart;
import lk.ijse.ecommerceapp.model.Order;
import lk.ijse.ecommerceapp.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/cart-check-out")
public class CheckOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try(PrintWriter out = resp.getWriter()) {

           SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
           Date date = new Date();

           ArrayList<Cart> cartArrayList = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
           User user = (User) req.getSession().getAttribute("user");

           if (cartArrayList != null && user != null) {
               for (Cart cart : cartArrayList) {
                   Order order = new Order();
                   order.setId(cart.getId());
                   order.setUid(cart.getId());
                   order.setQuantity(cart.getQuantity());
                   order.setDate(formatter.format(date));

                   OrderDao orderDao = new OrderDao(DBConnectionUtil.getConnection());
                   boolean result = orderDao.insertOrder(order);
                   if (!result)break;
               }

               cartArrayList.clear();
               resp.sendRedirect("orders.jsp");
           }else {
               if (user == null) resp.sendRedirect("login.jsp");
               resp.sendRedirect("cart.jsp");
           }
       }catch (Exception e) {
           e.printStackTrace();
       }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
