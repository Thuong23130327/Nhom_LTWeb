
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://" + Property.HOST + ":" + Property.PORT + "/" + Property.DBName;
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(url, Property.USER, Property.PASS);
        return conn;
    }

    public static void main(String[] args) {
        try {
            DBConnect db = new DBConnect();
            Connection conn = db.getConnection();
            if (conn != null) {
                System.out.println( Property.DBName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
