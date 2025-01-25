package lk.ijse.ecommerceapp.dao;

import lk.ijse.ecommerceapp.model.Order;
import lk.ijse.ecommerceapp.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class OrderDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public OrderDao() {
    }

    public OrderDao(Connection con) {
        this.con = con;
    }

    public boolean insertOrder(Order order) {

        boolean result = false;

        try {
            query = "insert into orders  (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, order.getId());
            pst.setInt(2,order.getUid());
            pst.setInt(3,order.getQuantity());
            pst.setString(4,order.getDate());
            pst.executeUpdate();
            result = true;
        }catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT * FROM orders WHERE u_id=? ORDER BY orders.o_id DESC";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("p_id");

                Product product = productDao.getSingleProduct(pId);

                order.setOrderId(rs.getInt("o_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategoryId(product.getCategoryId());

                BigDecimal pricePerUnit = product.getPrice();
                int quantity = rs.getInt("o_quantity");
                BigDecimal totalPrice = pricePerUnit.multiply(BigDecimal.valueOf(quantity));
                order.setPrice(totalPrice);

                order.setQuantity(quantity);
                order.setDate(rs.getString("o_date"));

                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void cancelOrder(int id) {
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
