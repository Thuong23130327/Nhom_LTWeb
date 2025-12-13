package dao;

import java.util.ArrayList;
import java.util.List;

import model.Brand;

// Import các thư viện JDBC cần thiết (Connection, PreparedStatement, ResultSet...)

public class BrandDAO {
    
    // Giả định bạn đã có lớp DBContext để quản lý kết nối DB
    
    // Phương thức A1
    public List<Brand> getAll() {
        List<Brand> list = new ArrayList<>();
        // Định nghĩa câu lệnh SQL
        String sql = "SELECT brand_id, name, logo_url FROM Brands"; 
        
        try {
            // 1. Lấy kết nối DB (Connection conn = DBContext.getConnection())
            // 2. Chuẩn bị câu lệnh (PreparedStatement ps = conn.prepareStatement(sql))
            // 3. Thực thi truy vấn (ResultSet rs = ps.executeQuery())
            
            // 4. Lặp qua ResultSet và ánh xạ sang Model Brand
            /*
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("name"));
                brand.setLogoUrl(rs.getString("logo_url"));
                list.add(brand);
            }
            */
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
// Tương tự cho CategoryDAO.java (dùng SELECT * FROM Categories)