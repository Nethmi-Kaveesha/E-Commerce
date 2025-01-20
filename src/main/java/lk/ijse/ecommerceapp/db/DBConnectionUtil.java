package lk.ijse.ecommerceapp.db;



import java.sql.Connection;
import java.sql.SQLException;

public class DBConnectionUtil {
    public static Connection getConnection() throws SQLException {
        return DataSourceFactory.getDataSource().getConnection();
    }
}
