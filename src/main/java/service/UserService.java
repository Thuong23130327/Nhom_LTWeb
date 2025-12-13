package service;

import dao.UserDAO;
import model.User;

public class UserService {

    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public User findUserByEmail(String email) {
        return userDAO.getUserByEmail(email);
    }

}