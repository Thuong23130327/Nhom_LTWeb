package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private static final String URL = "jdbc:mysql://localhost:3306/aurasound_db?useSSL=false&serverTimezone=Asia/Ho_Chi_Minh&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASS = "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(URL, USER, PASS);

        }  catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        System.out.println("🔄 Đang thử kết nối đến: " + URL);
        Connection c = getConnection();
        if (c != null) {
            System.out.println("THÀNH CÔNG");
        } else {
            System.out.println("THẤT BẠI");
        }
    }
}