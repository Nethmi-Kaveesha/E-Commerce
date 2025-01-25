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
            HikariConfig config = new HikariConfig();
            config.setJdbcUrl("jdbc:mysql://localhost:3306/ecommerce");
            config.setUsername("root");
            config.setPassword("pass123");
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");

            config.setMaximumPoolSize(20);
            config.setMinimumIdle(5);
            config.setIdleTimeout(30000);
            config.setConnectionTimeout(30000);
            config.setMaxLifetime(1800000);

            config.setConnectionTestQuery("SELECT 1");

            dataSource = new HikariDataSource(config);

            logger.info("DataSource initialized successfully.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Failed to initialize the data source: " + e.getMessage(), e);
            throw new ExceptionInInitializerError("Failed to initialize the data source: " + e.getMessage());
        }
    }

    private DataSourceFactory() {
    }

    public static DataSource getDataSource() {
        return dataSource;
    }

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
