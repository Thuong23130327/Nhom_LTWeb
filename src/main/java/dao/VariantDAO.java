package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ProductVariant;

public class VariantDAO {
	public List<ProductVariant> getVariantsByProductId(int productId) {
		List<ProductVariant> list = new ArrayList<>();
		String sql = "SELECT * FROM ProductVariants WHERE Products_id = ?";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, productId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductVariant v = new ProductVariant();
				v.setId(rs.getInt("id"));
				v.setVariantSku(rs.getString("variant_sku"));
				v.setColorName(rs.getString("color_name"));
				v.setMainImageUlr(rs.getString("main_image_url"));
				v.setMarketPrice(rs.getDouble("market_price"));
				v.setSellPrice(rs.getDouble("sell_price"));
				v.setStockQuantity(rs.getInt("stock_quantity"));
				list.add(v);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}