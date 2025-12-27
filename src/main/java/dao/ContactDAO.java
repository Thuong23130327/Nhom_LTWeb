package dao;

import model.Contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactDAO {
    public static boolean insertContact(Contact contact) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO ContactMails"
                + " (Users_id, sender_name, sender_email, sender_phone, message, status, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, NOW())";
        Connection conn = DBConnect.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
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
}
