package lk.ijse.ecommerceapp.db; // Your package name



import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        try (Connection connection = DataSourceFactory.getDataSource().getConnection()) {
            System.out.println("Connection successful: " + (connection != null));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
