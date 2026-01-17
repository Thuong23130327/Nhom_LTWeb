package service;

import dao.adminDAO.UserDAO;
import model.User;
import util.MD5;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

//KO SUA CUA TUI NHE
public class UserService {

    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public User findUserByEmail(String email) {
        return userDAO.getUserByEmail(email);
    }

    public User login(String email, String password) throws NoSuchAlgorithmException, SQLException {
        String passHash = MD5.getMd5(password);
        User user = userDAO.checkLogin(email, passHash);
        return user;
    }


    public boolean register(String email, String passwordRaw, String fullname) throws NoSuchAlgorithmException {
        String passHash = MD5.getMd5(passwordRaw);
        return userDAO.register(email, passHash, fullname);
    }

    public boolean checkExistMail(String password) {
        return UserDAO.checkExistMail(password);
    }

    public List<User> getAllUsers() {
        return userDAO.getAllUser();
    }

}
