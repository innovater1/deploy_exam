package test.dao;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectTests {
    @Test
    public void testConnection() throws Exception {
        Class.forName("org.mariadb.jdbc.Driver");

        String url = "jdbc:mariadb://localhost:3308/todo";
        String user ="root";
        String password = "9559";

        Connection connection = DriverManager.getConnection(url, user, password);
        Assertions.assertNotNull(connection); // 인수가 null이 아닌지 확인 -> null이 아니면 객체를 참조하고 있다.
        connection.close();
    }
    @Test
    public void testHikariCP() throws Exception {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("org.mariadb.jdbc.Driver");
        config.setJdbcUrl("jdbc:mariadb://localhost:3308/todo");
        config.setUsername("root");
        config.setPassword("9559");
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

        HikariDataSource ds = new HikariDataSource(config);
        Connection connection = ds.getConnection();

        System.out.println(connection);

        connection.close();
    }
}
