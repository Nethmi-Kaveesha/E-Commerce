package lk.ijse.ecommerceapp.model;

import java.math.BigDecimal;

public class Order extends Product{
    private int orderId;
    private int uid;
    private int quantity;
    private String date;

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", uid=" + uid +
                ", quantity=" + quantity +
                ", date='" + date + '\'' +
                '}';
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Order(int orderId) {
        this.orderId = orderId;
    }

    public Order(int id, String name, int categoryId, BigDecimal price, String image, int orderId) {
        super(id, name, categoryId, price, image);
        this.orderId = orderId;
    }

    public Order(int id, String name, int categoryId, String categoryName, BigDecimal price, String image, int orderId) {
        super(id, name, categoryId, categoryName, price, image);
        this.orderId = orderId;
    }

    public Order() {
    }
}