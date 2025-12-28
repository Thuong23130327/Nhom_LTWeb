package service;

import dao.ContactDAO;
import model.Contact;
import model.User;

import java.sql.SQLException;

public class ContactService {
    ContactDAO contactDAO = new ContactDAO();


    public boolean sendContactMail(String email, String name, String phone, String message, User user) throws SQLException, ClassNotFoundException {

        Integer userId = (user != null) ? user.getId() : null;

        Contact contact = new Contact(userId, email, name, phone, message);
        return ContactDAO.insertContact(contact);

    }
}
