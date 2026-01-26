package dao;

import java.sql.*;

public class ReviewDAO {

    public int saveReview(String pid, String uid, String rating, String comment) {
        String sql = "INSERT INTO reviews (Products_id, Users_id, rating, comment) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, pid);
            ps.setString(2, uid);
            ps.setString(3, rating);
            ps.setString(4, comment);

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean saveReviewImages(int reviewId, String imageUrl) {
        if (imageUrl == null || imageUrl.isEmpty()) return false;

        String sql = "INSERT INTO reviewgalleries (Reviews_id, image_url) VALUES (?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reviewId);
            ps.setString(2, imageUrl);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateProductAvgRating(String productId) {
        String sql = "UPDATE products SET avg_rating = (SELECT AVG(CAST(rating AS DECIMAL(10,2))) " +
                "FROM reviews WHERE Products_id = ?) WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, productId);
            ps.setString(2, productId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


}