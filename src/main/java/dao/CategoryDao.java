package dao;

import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT category_id, name FROM Categories";

        try (
                Connection conn = DBConnect.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
        ) {
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("category_id"));
                c.setName(rs.getString("name"));

                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Category getById(int id) {
        String sql = "SELECT category_id, name FROM Categories WHERE category_id = ?";
        Category c = null;

        try (
                Connection conn = DBConnect.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Category();
                c.setId(rs.getInt("category_id"));
                c.setName(rs.getString("name"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return c;
    }



}
