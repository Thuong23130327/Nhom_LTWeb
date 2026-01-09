package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Brand;

public class BrandDAO {
    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//    Lay all brand
    public List<Brand> getAll() throws SQLException, ClassNotFoundException {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT * FROM Brands";
        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Brand b = new Brand(rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("logo_url")
            );
            list.add(b);
        }
        return list;
    }

//    Lay brand theo id brand
    public Brand getById(String id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Brands WHERE id = ?";
        Brand b = null;
        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        rs = ps.executeQuery();

        while (rs.next()) {
           b = new Brand(rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("logo_url")
            );
        }
        return b;
    }

}