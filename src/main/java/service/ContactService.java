package service;

import dao.ContactDAO;
import model.Contact;
import model.ContactReply;
import model.User;

import java.sql.SQLException;
import java.util.List;

public class ContactService {
    ContactDAO contactDAO = new ContactDAO();


    public boolean sendContactMail(String email, String name, String phone, String message, User user) throws SQLException, ClassNotFoundException {
        if (message.equals("")) return false;
        Integer userId = (user != null) ? user.getId() : null;
        Contact contact = new Contact(userId, email, name, phone, message);
        return ContactDAO.insertContact(contact);
    }
    
	public List<ContactReply> getReplies(int contactId) {
		return contactDAO.getReplies(contactId);
		
		
	}

	public void addReply(ContactReply reply) {
		contactDAO.addReply(reply);
	}

    public List<Contact> getAllContacts() throws SQLException, ClassNotFoundException {
        ContactDAO contactDAO = new ContactDAO();
        return contactDAO.getAllContacts();
    }
}
