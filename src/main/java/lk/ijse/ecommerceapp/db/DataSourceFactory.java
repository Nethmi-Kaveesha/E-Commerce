package lk.ijse.ecommerceapp.db;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataSourceFactory {

    private static final HikariDataSource dataSource;
    private static final Logger logger = Logger.getLogger(DataSourceFactory.class.getName());

    static {
        try {
            // Configure HikariCP
            HikariConfig config = new HikariConfig();
            config.setJdbcUrl("jdbc:mysql://localhost:3306/ecommerce"); // Update with your database name
            config.setUsername("root"); // Update with your MySQL username
            config.setPassword("pass123"); // Update with your MySQL password
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");

            // Connection pool settings
            config.setMaximumPoolSize(20); // Increase max pool size to 20
            config.setMinimumIdle(5); // Minimum idle connections in the pool
            config.setIdleTimeout(30000); // Maximum idle time for connections in milliseconds
            config.setConnectionTimeout(30000); // Maximum wait time for a connection in milliseconds
            config.setMaxLifetime(1800000); // Maximum lifetime of a connection in milliseconds

            // Optional: Test query to validate connections
            config.setConnectionTestQuery("SELECT 1");

            // Initialize the HikariDataSource
            dataSource = new HikariDataSource(config);

            logger.info("DataSource initialized successfully.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Failed to initialize the data source: " + e.getMessage(), e);
            throw new ExceptionInInitializerError("Failed to initialize the data source: " + e.getMessage());
        }
    }

    private DataSourceFactory() {
        // Prevent instantiation
    }

    public static DataSource getDataSource() {
        return dataSource;
    }

    // Optional: Method to close the data source when the application shuts down
    public static void closeDataSource() {
        if (dataSource != null && !dataSource.isClosed()) {
            try {
                dataSource.close();
                logger.info("DataSource closed successfully.");
            } catch (Exception e) {
                logger.log(Level.WARNING, "Failed to close the data source: " + e.getMessage(), e);
            }
        }
    }
}
