package dao;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection conn;

    public  ProductDAO() throws SQLException, ClassNotFoundException {
        conn = DBConnect.getConnection();
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        String sql = """
        SELECT id, sku, name, description, avg_rating, sold_count,
               brand_id, categories_id, is_active, created_at
        FROM Products
    """;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getInt("brand_id"),
                        rs.getInt("categories_id"),
                        rs.getBoolean("is_active"),
                        rs.getDate("created_at").toLocalDate()
                );
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    public Product getById(int id) {
        String sql = "SELECT * FROM Products WHERE id = ?";
// Lấy kết nối trực tiếp để tự động trả về Pool
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
// Giữ nguyên logic khởi tạo Product
                    return new Product(
                            rs.getInt("id"),
                            rs.getString("sku"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getFloat("avg_rating"),
                            rs.getInt("sold_count"),
                            rs.getInt("brand_id"),
                            rs.getInt("categories_id"),
                            rs.getBoolean("is_active"),
                            rs.getDate("created_at").toLocalDate()
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public List<Product> getNewArrivals(int limit) {
        List<Product> list = new ArrayList<>();

        String sql = """
        SELECT id, sku, name, description, avg_rating, sold_count,
               brand_id, categories_id, is_active, created_at
        FROM Products WHERE id = ?
    """;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit); // gán giá trị cho LIMIT

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getInt("brand_id"),
                        rs.getInt("categories_id"),
                        rs.getBoolean("is_active"),
                        rs.getDate("created_at").toLocalDate()
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Product> getProductsByCategory(int idCategory) {
        List<Product> list = new ArrayList<>();

        String sql = """
        SELECT id, sku, name, description, avg_rating, sold_count,
               brand_id, categories_id, is_active, created_at
        FROM Products
        WHERE categories_id = ?
    """;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idCategory);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getInt("brand_id"),
                        rs.getInt("categories_id"),
                        rs.getBoolean("is_active"),
                        rs.getDate("created_at").toLocalDate()
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


}
