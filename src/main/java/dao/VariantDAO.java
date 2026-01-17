package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ProductVariant;

public class VariantDAO {
    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    public List<ProductVariant> getVariantsByProductId(String productId) {
        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductVariants WHERE Products_id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductVariant v = new ProductVariant();
                v.setId(rs.getInt("id"));
                v.setProductId(rs.getInt("Products_id"));
                v.setVariantSku(rs.getString("variant_sku"));
                v.setColorName(rs.getString("color_name"));
                v.setMainImageUrl(rs.getString("main_image_url"));
                v.setMarketPrice(rs.getDouble("market_price"));
                v.setSellPrice(rs.getDouble("sell_price"));
                v.setStockQuantity(rs.getInt("stock_quantity"));
                v.setDefault(rs.getBoolean("is_default"));
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public boolean deleteVariant(String vid) {


        String sql = "DELETE FROM productvariants WHERE id =? ;\n";


        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, vid);
            int afRow = ps.executeUpdate();
            return afRow > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return false;

    }
}