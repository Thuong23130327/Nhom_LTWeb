package dao.profileMDAO;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileDAO {

    private Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ProfileDAO() {
        try {
            this.conn = dao.DBConnect.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int userId){

        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password_hash"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("avatar_url"),
                        User.Role.valueOf(rs.getString("role")),
                        rs.getBoolean("is_locked"),
                        rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUserInfo(int userId, String fullName, String phone) {
        String sql = "UPDATE users SET full_name = ?, phone = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setInt(3, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
