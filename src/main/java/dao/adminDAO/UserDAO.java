package dao.adminDAO;

import dao.DBConnect;
import model.User;
import model.User.Role;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private User mapUser(ResultSet rs) throws SQLException {
        if (rs != null) {
            int id = rs.getInt("id");
            String dbEmail = rs.getString("email");
            String dbPass = rs.getString("password_hash");
            String dbName = rs.getString("full_name");
            String dbPhone = rs.getString("phone");
            String dbAvt = rs.getString("avatar_url");

            String role = rs.getString("role");
            boolean locked = rs.getBoolean("is_locked");
            Timestamp created = rs.getTimestamp("created_at");
            return new User(id, dbEmail, dbPass, dbName, dbPhone, dbAvt, Role.valueOf(role), locked, created);
        } else {
            return null;
        }
    }

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

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);

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


    public boolean register(String email, String passHash, String fullname) {

        String sql = "INSERT INTO Users (email, password_hash, full_name) VALUES (?, ?, ?)";

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, passHash);
            ps.setString(3, fullname);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                User newUser = new User(email, passHash, fullname);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getAllUser() {
        List<User> users = new ArrayList<User>();
        String sql = "SELECT id, email, password_hash, full_name, role, is_locked, created_at FROM Users";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password_hash"),
                        rs.getString("full_name"),
                        null,
                        null,
                        User.Role.valueOf(rs.getString("role")),
                        rs.getBoolean("is_locked"),
                        rs.getTimestamp("created_at")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public User getUserByEmail(String email) {
        return null;
    }


    public User getUserById(String id) {
        String sql = "SELECT * FROM Users WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) return mapUser(rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        System.out.println(userDAO.getAllUser());
    }
}