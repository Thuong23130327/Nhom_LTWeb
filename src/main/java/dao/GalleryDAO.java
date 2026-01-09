package dao;


import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GalleryDAO {
    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<String> getImagesByProductId(String productId) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT * FROM ProductGalleries WHERE Products_id = ? ORDER BY sort_order";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("image_url"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return images;
    }
}
