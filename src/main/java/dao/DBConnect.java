package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static final String URL = "jdbc:mysql://localhost:3306/aurasound_db?" + "useSSL=false&"
			+ "serverTimezone=Asia/Ho_Chi_Minh&" + "allowPublicKeyRetrieval=true";

	private static final String USER = "root";
	private static final String PASS = "";

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(URL, USER, PASS);
		} catch (ClassNotFoundException e) {
			System.err.println("❌ Lỗi: Thiếu Driver MySQL (Cần add file .jar vào lib)");
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("❌ Lỗi: Kết nối thất bại. Kiểm tra lại URL, User, Pass hoặc MySQL đã bật chưa?");
			e.printStackTrace();
		}
		return conn;
	}

	public static void main(String[] args) {
		try (Connection c = getConnection()) {
			if (c != null) {
				System.out.println("✅ Kết nối thành công đến database: " + c.getCatalog());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}