package dao.adminDAO;

import dao.DBConnect;
import model.admin.ProductAdminDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminProductDAO {
    public List<ProductAdminDTO> getAllAdminProducts() {
        List<ProductAdminDTO> list = new ArrayList<>();
        // Câu lệnh SQL Join để lấy thông tin từ 2 bảng
        String sql = "SELECT p.id, pv.variant_sku, p.name, pv.stock_quantity, pv.sell_price " +
                "FROM products p " +
                "JOIN productvariants pv ON p.id = pv.Products_id " +
                "ORDER BY p.id ASC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new ProductAdminDTO(
                        rs.getInt("id"),
                        rs.getString("variant_sku"),
                        rs.getString("name"),
                        rs.getInt("stock_quantity"),
                        rs.getDouble("sell_price")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        AdminProductDAO adminProductDAO = new AdminProductDAO();
        List<ProductAdminDTO> list = adminProductDAO.getAllAdminProducts();

        for (ProductAdminDTO p : list) {
            System.out.println("ID: " + p.getProductId() + " | Mã SKU: " + p.getSku() + " | Tên: " + p.getName() + " | Giá: " + p.getPrice());
        }
    }}
