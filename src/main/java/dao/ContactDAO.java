package dao;

import model.Contact;
import model.ContactReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;

	public static boolean insertContact(Contact contact) throws SQLException, ClassNotFoundException {
		String sql = "INSERT INTO ContactMails"
				+ " (Users_id, sender_name, sender_email, sender_phone, message, status, created_at) "
				+ "VALUES (?, ?, ?, ?, ?, ?, NOW())";
		conn = DBConnect.getConnection();
		ps = conn.prepareStatement(sql);

		if (contact.getUsersID() == null) {
			ps.setNull(1, java.sql.Types.INTEGER);
		} else {
			ps.setInt(1, contact.getUsersID());
		}

		ps.setString(2, contact.getSenderName());
		ps.setString(3, contact.getSenderMail());
		ps.setString(4, contact.getPhone());
		ps.setString(5, contact.getMess());
		ps.setString(6, contact.getStatus().toString());

		int i = ps.executeUpdate();
		return i > 0;

	}

	public List<Contact> getAllContacts() throws SQLException, ClassNotFoundException {
		List<Contact> lists = new ArrayList<Contact>();
		String sql = "SELECT * FROM ContactMails";

		conn = DBConnect.getConnection();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while (rs.next()) {
			Contact contact = new Contact();
			contact.setId(rs.getInt(1));
			contact.setUsersID(rs.getInt(2));
			contact.setSenderName(rs.getString(3));
			contact.setSenderMail(rs.getString(4));
			contact.setPhone(rs.getString(5));
			contact.setMess(rs.getString(6));
			contact.setStatus(Contact.Status.valueOf(rs.getString(8)));
			lists.add(contact);
		}

		return lists;
	}

	public List<ContactReply> getReplies(int contactId) {
		List<ContactReply> list = new ArrayList<>();
		String sql = "SELECT * FROM ContactReplies WHERE contact_id = ? ORDER BY created_at ASC";

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, contactId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ContactReply r = new ContactReply();
				r.setId(rs.getInt("id"));
				r.setContactId(rs.getInt("contact_id"));
				r.setSenderType(rs.getString("sender_type"));
				r.setMessage(rs.getString("message"));
				r.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addReply(ContactReply reply) {
		String sql = "INSERT INTO ContactReplies (contact_id, sender_type, message, created_at) VALUES (?, ?, ?, NOW())";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, reply.getContactId());
			ps.setString(2, reply.getSenderType());
			ps.setString(3, reply.getMessage());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
