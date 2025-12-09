package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    // 1. Thông tin cấu hình Database
    // Lưu ý: Tên DB là 'aurasound_db' dựa trên ảnh Navicat của bạn
    private static final String URL = "jdbc:mysql://localhost:3306/aurasound_db?useSSL=false&serverTimezone=UTC";

    // WAMP mặc định user là 'root' và password để TRỐNG (rỗng)
    private static final String USER = "root";
    private static final String PASS = "";

    // 2. Phương thức lấy kết nối
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Nạp Driver MySQL mới (com.mysql.cj.jdbc.Driver)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Mở kết nối
            conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("✅ Chúc mừng! Kết nối MySQL thành công!");

        } catch (ClassNotFoundException e) {
            System.err.println("❌ Lỗi: Không tìm thấy thư viện MySQL JDBC Driver!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ Lỗi: Không thể kết nối đến Database! Kiểm tra lại tên DB, User hoặc Pass.");
            e.printStackTrace();
        }
        return conn;
    }

    // 3. Hàm Main để chạy thử trực tiếp (Không cần bật Tomcat)
    public static void main(String[] args) {
        // Gọi thử hàm kết nối xem sao
        getConnection();
    }
}