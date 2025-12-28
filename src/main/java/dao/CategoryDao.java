package dao;

import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
	private Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<Category> getAllCategories() throws SQLException, ClassNotFoundException {
		List<Category> list = new ArrayList<>();
		String sql = "SELECT * FROM Categories";
		try {
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Category c = new Category(rs.getInt(1), rs.getNString(2));
				int idParent = rs.getInt(3);
				if (idParent != 0) {
					c.setParentID(idParent);
				}
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public Category getById(int id) {
		String sql = "SELECT category_id, name FROM Categories WHERE category_id = ?";
		Category c = null;

		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
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

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        CategoryDao dao = new CategoryDao();
        List<Category> l = dao.getAllCategories();
        System.out.println(l);
    }

}
