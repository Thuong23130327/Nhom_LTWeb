package dao;


import model.Image;

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

    public List<Image> getImagesByProductId(String productId) {
        List<Image> images = new ArrayList<>();
        String sql = "SELECT * FROM ProductGalleries WHERE Products_id = ? ORDER BY sort_order";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Image i = new Image(rs.getInt("id"), rs.getInt("products_id"), rs.getString("image_url"), rs.getInt("sort_order"));
                images.add(i);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return images;
    }

    public boolean addImage(int productId, String imageUrl, int sortOrder) {
        String sql = "INSERT INTO productgalleries (Products_id, image_url, sort_order) VALUES (?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ps.setString(2, imageUrl);
            ps.setInt(3, sortOrder);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteImage(int id) {
        String sql = "DELETE FROM productgalleries WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean updateOrderImage(String[] inputImageIds, String[] inputOrderIds) {
        String sql = "UPDATE productgalleries SET sort_order = ? WHERE id = ?";
        try (Connection conn = DBConnect.getConnection()) {
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            for (int i = 0; i < inputImageIds.length; i++) {
                ps.setString(1, inputOrderIds[i]);
                ps.setString(2, inputImageIds[i]);
                ps.addBatch();
            }
            ps.executeBatch();
            conn.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getMaxSortOrder(int productId) {
        String sql = "SELECT MAX(sort_order) FROM productgalerries WHERE Products_id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
