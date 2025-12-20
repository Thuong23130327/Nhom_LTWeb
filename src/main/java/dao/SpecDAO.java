package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ProductSpec;

public class SpecDAO {

	public List<ProductSpec> getSpecsByProductId(int productId) {
		List<ProductSpec> list = new ArrayList<>();
		String sql = "SELECT * FROM ProductSpecs WHERE Products_id = ?";

		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, productId);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {

					ProductSpec spec = new ProductSpec();
					spec.setId(rs.getInt("id"));
					spec.setProductId(rs.getInt("Products_id"));
					spec.setSpecName(rs.getString("spec_name"));
					spec.setSpecValue(rs.getString("spec_value"));

					list.add(spec);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}