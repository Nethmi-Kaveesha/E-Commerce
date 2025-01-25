package lk.ijse.ecommerceapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapp.dao.OrderDao;
import lk.ijse.ecommerceapp.db.DBConnectionUtil;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cancel-order")
public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()){
            String id = req.getParameter("id");
            if (id != null) {
                OrderDao orderDao = new OrderDao(DBConnectionUtil.getConnection());
                orderDao.cancelOrder(Integer.parseInt(id));
            }
            resp.sendRedirect("orders.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
