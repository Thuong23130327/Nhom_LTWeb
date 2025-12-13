package dao;


import model.User;

public class UserDAO {

    // Phương thức B1
    public User getUserByEmail(String email) {
        User user = null;
        String sql = "SELECT id, email, password_hash, full_name, role FROM Users WHERE email = ?";

        try {
            // 1. Lấy kết nối DB
            // 2. Chuẩn bị câu lệnh và SET tham số email (ps.setString(1, email))
            // 3. Thực thi truy vấn và ánh xạ sang Model User
            /*
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password_hash"));
                user.setFullName(rs.getString("full_name"));
                // Chuyển đổi String/Enum (rs.getString("role")) sang User.Role
            }
            */
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}