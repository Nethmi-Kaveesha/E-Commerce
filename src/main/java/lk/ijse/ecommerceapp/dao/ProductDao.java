package lk.ijse.ecommerceapp.dao;
import lk.ijse.ecommerceapp.model.Cart;
import lk.ijse.ecommerceapp.model.Product;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductDao() {}

    public ProductDao(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();

        try {
            query = "SELECT * FROM products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategoryId(rs.getInt("category_id"));
                row.setPrice(BigDecimal.valueOf(rs.getDouble("price")));
                row.setImage(rs.getString("image"));

                products.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getProductById(int id) {
        Product product = null;
        try {
            query = "SELECT * FROM products WHERE id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setPrice(BigDecimal.valueOf(rs.getDouble("price")));
                product.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> products = new ArrayList<Cart>();

        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    Product product = getProductById(item.getId());
                    if (product != null) {
                        Cart cartItem = new Cart();
                        cartItem.setId(product.getId());
                        cartItem.setName(product.getName());
                        cartItem.setCategoryId(product.getCategoryId());
                        cartItem.setPrice(product.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())));
                        cartItem.setQuantity(item.getQuantity());

                        products.add(cartItem);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        return products;
    }

    public Product getSingleProduct(int id) {
        Product row = null;

        try {
            query = "SELECT * FROM products WHERE id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategoryId(rs.getInt("category_id"));
                row.setPrice(BigDecimal.valueOf(rs.getDouble("price")));
                row.setImage(rs.getString("image"));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;

        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();

                    while (rs.next()) {
                        sum += rs.getDouble("price")*item.getQuantity();

                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        return sum;
    }

    public List<Product> getProductsSortedByPrice(String sortOrder) throws SQLException {
        String query = "SELECT * FROM products ORDER BY price " + sortOrder;
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        List<Product> productList = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getBigDecimal("price"));
            product.setCategoryId(rs.getInt("category_id"));
            product.setImage(rs.getString("image"));
            productList.add(product);
        }
        return productList;
    }



}
