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
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/order-now")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try (PrintWriter out = resp.getWriter()){

           SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

           Date date = new Date();

           User user = (User) req.getSession().getAttribute("user");
           if (user != null){
               String productId = req.getParameter("id");
               int productQuantity = Integer.parseInt(req.getParameter("quantity"));
               if (productQuantity <=0){
                   productQuantity = 1;
               }

               Order order = new Order();
               order.setId(Integer.parseInt(req.getParameter("id")));
               order.setUid(user.getId());
               order.setQuantity(productQuantity);
               order.setDate(formatter.format(date));

               OrderDao orderDao = new OrderDao(DBConnectionUtil.getConnection());
               boolean result = orderDao.insertOrder(order);

               if (result){
                   ArrayList<Cart> cartArrayList = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
                   if(cartArrayList != null) {
                       for(Cart cart : cartArrayList) {
                           if (cart.getId()==Integer.parseInt(productId)) {
                               cartArrayList.remove(cartArrayList.indexOf(cart));
                               break;
                           }
                       }

                   }
                   resp.sendRedirect("orders.jsp");
               }else {
                   out.println("order failed");
               }
           }else {
               resp.sendRedirect("login.jsp");
           }
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
