package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public User checkLogin(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE email = ? AND password_hash = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));

                String roleStr = rs.getString("role");
                try {
                    user.setRole(model.User.Role.valueOf(roleStr));
                } catch (Exception e) {
                    // Mặc định là Customer nếu lỗi
                    user.setRole(model.User.Role.Customer);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean register(User user) {
        String sql = "INSERT INTO Users (email, password_hash, full_name, role, is_locked, created_at) " +
                "VALUES (?, ?, ?, ?, ?, NOW())";

        // 2. Mở kết nối
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getFullName());

            ps.setString(4, user.getRole().name());

            ps.setBoolean(5, false);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}