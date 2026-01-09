package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ProductSpec;

public class SpecDAO {
    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//Lay thong so tu prdid
    public List<ProductSpec> getSpecsByProductId(String productId) {
        List<ProductSpec> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductSpecs WHERE Products_id = ?";

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductSpec spec = new ProductSpec(rs.getInt("id"),
                            rs.getInt("Products_id"),
                            rs.getString("spec_name"),
                            rs.getString("spec_value"));
                    list.add(spec);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}