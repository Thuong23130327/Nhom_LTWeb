package dao;

import model.Category;
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
                + " (Users_id, sender_name, sender_email, sender_phone, message,reply_content, status, created_at) "
                + "VALUES (?, ?, ?, ?, ?,?,?, NOW())";
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
        ps.setString(6, contact.getReplyMess());
        ps.setString(7, contact.getStatus().toString());

        int i = ps.executeUpdate();
        return i > 0;

    }

    private Contact mapContact(ResultSet rs) throws SQLException {
        Contact contact = new Contact();
        contact.setId(rs.getInt(1));
        contact.setUsersID(rs.getInt(2));
        contact.setSenderName(rs.getString(3));
        contact.setSenderMail(rs.getString(4));
        contact.setPhone(rs.getString(5));
        contact.setMess(rs.getString(6));
        contact.setReplyMess(rs.getString(7));
        contact.setStatus(Contact.Status.valueOf(rs.getString(8)));
        contact.setCreatedAt(rs.getTimestamp(9));
        return contact;
    }

    public List<Contact> getAllContacts() throws SQLException, ClassNotFoundException {
        List<Contact> lists = new ArrayList<Contact>();
        String sql = "SELECT * FROM contactmails WHERE message is not null and trim(message) <>''";

        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            lists.add(mapContact(rs));
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

    public Contact getContact(String id) {
        String sql = "SELECT * FROM contactmails WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return mapContact(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void saveReply(String mailId, String replyContent) {
        String sql = "UPDATE contactmails SET status = 'Replied', reply_content = ? WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, replyContent);
            ps.setString(2, mailId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Contact> sort(String type) {
        StringBuilder sql = new StringBuilder("SELECT * FROM contactmails WHERE message is not null and trim(message) <>''");
        List<Contact> list = new ArrayList<>();
        if (type == null) return null;
        switch (type) {
            case "rep":
                sql.append(" and status ='Replied' order by created_at DESC");
                break;
            case "non":
                sql.append(" and status ='New' order by created_at DESC");
                break;
            case "old":
                sql.append(" order by created_at");
                break;
            case "new":
                sql.append("  order by created_at DESC");
                break;
        }
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(String.valueOf(sql));
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapContact(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
