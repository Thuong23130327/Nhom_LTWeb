package dao;

import model.User;
import model.User.Role;
import util.MD5;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public static boolean checkExistMail(String email) {

        String sql = "Select id from users where email =?";
        try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public User checkLogin(String email, String passHash) throws NoSuchAlgorithmException, SQLException {
        User user = null;


        String sql = "SELECT * FROM Users WHERE email = ? AND password_hash = ?";

        try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, passHash);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String dbEmail = rs.getString("email");
                String dbPass = rs.getString("password_hash");
                String dbName = rs.getString("full_name");
                String dbPhone = rs.getString("phone");
                String dbAvt = rs.getString("avatar_url");

                String role = rs.getString("role");

                boolean locked = rs.getBoolean("is_locked");
                Timestamp created = rs.getTimestamp("created_at");

                user = new User(id, dbEmail, dbPass, dbName, dbPhone, dbAvt, Role.valueOf(role), locked, created);
            }
            return user;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean register(User user) {

        String sql = "INSERT INTO Users (email, password_hash, full_name) VALUES (?, ?, ?)";

        // 2. Mở kết nối
        try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getFullName());

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getAllUser() {
        List<User> users = new ArrayList<User>();
        String sql = "SELECT * FROM Users";
        try {
            Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String dbEmail = rs.getString(2);
                String dbPass = rs.getString(3);
                String dbName = rs.getString(4);
//                String dbPass = rs.getString(5);
//                String dbPass = rs.getString(6);
                users.add(new User(id, dbEmail, dbPass, dbName));
            }
        } catch (Exception e) {

        }
        return users;
    }

    public User getUserByEmail(String email) {


        return null;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        System.out.println(userDAO.getAllUser());
    }
}