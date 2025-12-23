package dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DBConnect {
	private static DataSource dataSource;

	static {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/AuraSoundDB");
		} catch (NamingException e) {
			System.err.println("❌ Lỗi cấu hình JNDI: " + e.getMessage());
		}
	}

	public static Connection getConnection() throws SQLException {
		if (dataSource == null) {
			throw new SQLException("❌ DataSource không khả dụng.");
		}
		return dataSource.getConnection();
	}
}