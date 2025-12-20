package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Brand;

public class BrandDAO {

    public List<Brand> getAll() {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT brand_id, name, logo_url FROM Brands";

        try (
                Connection conn = DBConnect.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
        ) {
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("name"));
                brand.setLogoUrl(rs.getString("logo_url"));

                list.add(brand);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Brand getById(int id) {
        String sql = "SELECT brand_id, name, logo_url FROM Brands WHERE brand_id = ?";
        Brand brand = null;

        try (
                Connection conn = DBConnect.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setInt(1, id); // gán giá trị cho dấu ?
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("name"));
                brand.setLogoUrl(rs.getString("logo_url"));
            }

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return brand;
    }

}
// Tương tự cho CategoryDAO.java (dùng SELECT * FROM Categories)