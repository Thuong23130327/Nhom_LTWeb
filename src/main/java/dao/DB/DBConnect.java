package dao.DB;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import dao.DBProperties;
import org.jdbi.v3.core.Jdbi;

public class DBConnect {

    private static HikariDataSource dataSource;
    private static Jdbi jdbi;

    public static Jdbi getJdbi() {
        return jdbi;
    }

    static {
        try {
            HikariConfig config = new HikariConfig();
            String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();
            config.setJdbcUrl(url);
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");
            config.setUsername(DBProperties.username());
            config.setPassword(DBProperties.password());

            config.setMaximumPoolSize(20);
            config.setMinimumIdle(2);
            config.setIdleTimeout(30000);
            dataSource = new HikariDataSource(config);
            jdbi = Jdbi.create(dataSource);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Loi khoi tao HKR va JDBI");
        }


    }


}
