package lk.ijse.ecommerceapp.dao;

import lk.ijse.ecommerceapp.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private final Connection con;

    // Constructor to initialize the connection
    public UserDao(Connection con) {
        this.con = con;
    }

    /**
     * Method to authenticate user login.
     *
     * @param email    User's email
     * @param password User's password (already hashed if using hashing)
     * @return User object if authentication is successful, null otherwise
     */
    public User userLogin(String email, String password) {
        User user = null;

        // SQL query to authenticate user
        String query = "SELECT id, name, email, role, is_active FROM users WHERE email = ? AND password = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            // Set query parameters
            pst.setString(1, email);
            pst.setString(2, password); // Ensure password is hashed if stored as hashed

            // Execute query
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    // Populate user object if authentication is successful
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                    user.setActive(rs.getBoolean("is_active"));
                }
            }
        } catch (Exception e) {
            System.err.println("Error during user login: " + e.getMessage());
            e.printStackTrace();
        }

        return user;
    }
}
