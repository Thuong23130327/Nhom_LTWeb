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

    public boolean updateVariant(int vid, String sku, double oldP, double newP, int stock, String img) {
        // Nếu không up ảnh mới (img == null), giữ nguyên ảnh cũ trong SQL
        String sql = "UPDATE product_variants SET sku=?, market_price=?, sell_price=?, stock_quantity=?"
                + (img != null ? ", main_image_url=?" : "") + " WHERE id=?";
        try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, sku);
            ps.setDouble(2, oldP);
            ps.setDouble(3, newP);
            ps.setInt(4, stock);
            if (img != null) {
                ps.setString(5, img);
                ps.setInt(6, vid);
            } else {
                ps.setInt(5, vid);
            }
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

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

    public ProductVariant getProductVariant(String variantId) {
        String sql = "SELECT * FROM ProductVariants WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, variantId);
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

                return v;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateVariant(String vid, String inputClName, String inputStock, String inputOldP, String inputNewP, String finalImgUrl) throws SQLException {
        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);

            String sql = "UPDATE ProductVariants SET color_name= ?,stock_quantity=?, market_price=?, sell_price=?,main_image_url=? WHERE id=?";
            ps = conn.prepareStatement(sql);

            ps.setString(1, inputClName);
            ps.setString(2, inputStock);
            ps.setString(3, inputOldP);
            ps.setString(4, inputNewP);
            ps.setString(5, finalImgUrl);
            ps.setString(6, vid);

            ps.executeUpdate();
            conn.commit();
            return true;

        } catch (Exception e) {
            conn.rollback();
            return false;
        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }
    }


    public boolean addVariant(String inputPid, String inputClName, String inputStock, String inputOldP, String inputNewP, String finalImgUrl) throws SQLException {
        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);

            String sql = "insert into ProductVariants (products_id,color_name,stock_quantity, market_price, sell_price,main_image_url,is_default ) values (?,?,?,?,?,?,0 )";
            ps = conn.prepareStatement(sql);

            ps.setInt(1, (inputPid == null || inputPid.isEmpty()) ? 0 : Integer.parseInt(inputPid));
            ps.setString(2, inputClName);
            ps.setInt(3, (inputStock == null || inputStock.isEmpty()) ? 0 : Integer.parseInt(inputStock));
            ps.setDouble(4, (inputOldP == null || inputOldP.isEmpty()) ? 0.0 : Double.parseDouble(inputOldP));
            ps.setDouble(5, (inputNewP == null || inputNewP.isEmpty()) ? 0.0 : Double.parseDouble(inputNewP));
            ps.setString(6, finalImgUrl);
            int result = ps.executeUpdate();

            conn.commit();
            return result > 0;

        } catch (Exception e) {
            conn.rollback();
            System.err.println("❌ LỖI TẠI addVariant DAO: ");
            e.printStackTrace();
            return false;
        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }


    }
}