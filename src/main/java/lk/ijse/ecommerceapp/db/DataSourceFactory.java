package lk.ijse.ecommerceapp.db; // Your package name

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;

public class DataSourceFactory {
    private static HikariDataSource dataSource;

    static {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/ecommerce");
        config.setUsername("root"); // replace with your MySQL username
        config.setPassword("pass123"); // replace with your MySQL password
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(5);
        config.setIdleTimeout(30000);
        config.setConnectionTimeout(30000);

        dataSource = new HikariDataSource(config);
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}
