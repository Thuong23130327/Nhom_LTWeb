package service;

import dao.profileMDAO.ProfileDAO;
import model.User;

import java.sql.SQLException;

public class ProfileService {
    private ProfileDAO pDAO = new ProfileDAO();

    public User getUserById(int userId) throws SQLException {
        return pDAO.getUserById(userId);
    }

    public String updateProfile(int userId, String fullName, String phone) throws SQLException {
        if (fullName == null || fullName.trim().isEmpty()) {
            return "Họ tên không được để trống.";
        }
        if (phone == null || phone.trim().isEmpty()) {
            return "Số điện thoại không được để trống.";
        }

        if (fullName.trim().length() < 2 || fullName.trim().length() > 50) {
            return "Họ tên phải từ 2 đến 50 ký tự.";
        }
        boolean isSuccess = pDAO.updateUserInfo(userId, fullName.trim(), phone.trim());

        return isSuccess ? "success" : "Cập nhật thất bại tại hệ thống.";
    }



}


