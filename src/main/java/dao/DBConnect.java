
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(url, DBProperties.username(), DBProperties.password());
        return conn;
    }

    public static void main(String[] args) {
        try {
            DBConnect db = new DBConnect();
            Connection conn = db.getConnection();
            if (conn != null) {
                System.out.println("Kết nối thành công đến database: " + DBProperties.dbname());
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Kết nối thất bại!");
        }
    }

}
