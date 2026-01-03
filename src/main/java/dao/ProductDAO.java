package dao;

import model.Product;
//import model.ProductDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO  {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    static Map<Integer, Product> data = new HashMap<>();


    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        String sql = """
                    WITH RankedProducts AS (
                                     SELECT\s
                                         p.id,
                                         p.Brands_id,
                                         p.Categories_id,
                                         pv.variant_sku,
                                         p.NAME,
                                         p.description,
                                         p.avg_rating,
                                         p.sold_count,
                                         p.is_active,
                                         p.created_at,
                                         pv.market_price,
                                         pv.sell_price,
                                         pv.main_image_url,
                
                                         ROW_NUMBER() OVER (
                                             PARTITION BY p.id\s
                                             ORDER BY\s
                                                 pv.is_default DESC, 
                                                 RAND()               
                                         ) as rn
                
                                     FROM Products p
                                     JOIN ProductVariants pv ON pv.Products_id = p.id
                                     WHERE p.is_active = TRUE
                                 )
                                 SELECT * FROM RankedProducts\s
                                 WHERE rn = 1; 
                """;

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getInt(8),
                        rs.getBoolean(9),
                        rs.getDate(10).toLocalDate(),
                        rs.getDouble(11),
                        rs.getDouble(12),
                        rs.getString(13));

                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

//    public Product getById(int id) {
//        String sql = "SELECT * FROM Products WHERE id = ?";
//// Lấy kết nối trực tiếp để tự động trả về Pool
//        try (Connection conn = DBConnect.getConnection();
//             PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setInt(1, id);
//            try (ResultSet rs = ps.executeQuery()) {
//                if (rs.next()) {
// Giữ nguyên logic khởi tạo Product

//                            new Product(
//                            rs.getInt("id"),
//                            rs.getInt("brand_id"),
//                            rs.getInt("categories_id"),
//                            rs.getString("sku"),
//                            rs.getString("name"),
//                            rs.getString("description"),
//                            rs.getFloat("avg_rating"),
//                            rs.getInt("sold_count"),
//                            rs.getBoolean("is_active"),
//                            rs.getDouble("price"),
//                            rs.getDate("created_at").toLocalDate()
//                    );
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }
//        return null;
//    }
//
//    public List<Product> getNewArrivals(int limit) {
//        List<Product> list = new ArrayList<>();
//
//        String sql = """
//                    SELECT id, sku, name, description, avg_rating, sold_count,
//                           brand_id, categories_id, is_active, created_at, img, price
//                    FROM Products
//                    ORDER BY created_at DESC
//                    LIMIT ?
//                """;
//
//        try (PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setInt(1, limit);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                list.add(new Product(
//                        rs.getInt("id"),
//                        rs.getInt("brand_id"),
//                        rs.getInt("categories_id"),
//                        rs.getString("sku"),
//                        rs.getString("name"),
//                        rs.getString("description"),
//                        rs.getFloat("avg_rating"),
//                        rs.getInt("sold_count"),
//                        rs.getBoolean("is_active"),
//                        rs.getDouble("price"),
//                        rs.getDate("created_at").toLocalDate()
//                ));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    public List<Product> getProductsByCategory(int idCategory) {
//        List<Product> list = new ArrayList<>();
//        // Thêm 'price' và 'img' vào câu query
//        String sql = """
//                SELECT id, sku, name, description, avg_rating, sold_count,
//                       brand_id, categories_id, is_active, created_at, price, img
//                FROM Products
//                WHERE categories_id = ?""";
//        try (Connection conn = DBConnect.getConnection(); // Đảm bảo lấy connection ở đây
//             PreparedStatement ps = conn.prepareStatement(sql)) {
//
//            ps.setInt(1, idCategory);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                // Sử dụng constructor đầy đủ (bao gồm img và price)
//                Product p = new Product(
//                        rs.getInt("id"),
//                        rs.getInt("brand_id"),
//                        rs.getInt("categories_id"),
//                        rs.getString("sku"),
//                        rs.getString("name"),
//                        rs.getString("description"),
//                        rs.getFloat("avg_rating"),
//                        rs.getInt("sold_count"),
//                        rs.getBoolean("is_active"),
//                        rs.getDouble("price"),
//                        rs.getDate("created_at").toLocalDate()
//                );
//                list.add(p);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    public List<Product> getListProduct() {
//        return get().withHandle(h -> h.createQuery("select * from products").mapToBean(Product.class).list());
//    }
//
//    public Product getProduct(int id) {
//        return get().withHandle(h -> h.createQuery("select * from products where id = :id").bind("id", id).mapToBean(Product.class).stream().findFirst().orElse(null));
//    }
//
//    public void insert(List<Product> products) {
//        get().useHandle(h -> {
//            String sql = "INSERT INTO products (id, Brands_id, Categories_id, sku, NAME, description, avg_rating, sold_count, is_active, created_at) " +
//                    "VALUES (:id, :Brands_id, :Categories_id, :sku, :NAME, :description, :avg_rating, :sold_count, :is_active, :created_at)";
//
//            PreparedBatch batch = h.prepareBatch(sql);
//
//            for (Product p : products) {
//                batch.bind("id", p.getId())
//                        .bind("Brands_id", p.getBrandId())
//                        .bind("Categories_id", p.getCategoriesId())
//                        .bind("sku", p.getSku())
//                        .bind("NAME", p.getName())
//                        .bind("description", p.getDescription())
//                        .bind("avg_rating", p.getAvgRating())
//                        .bind("sold_count", p.getSoldCount())
//                        .bind("is_active", p.isActive() ? 1 : 0)
//                        .bind("created_at", p.getCreatedAt())
//                        .add();
//            }
//            batch.execute();
//        });
//    }
//
//    public List<ProductDTO> getProductDTOs() {
//        return get().withHandle(handle -> {
//            String sql = "SELECT p.id, " +
//                    "p.NAME AS name, " + // Đổi NAME (DB) thành name (Java)
//                    "pv.main_image_url AS mainImageUrl, " + // Đổi gạch dưới thành CamelCase
//                    "pv.market_price AS marketPrice, " +
//                    "pv.sell_price AS sellPrice, " +
//                    "p.sold_count AS soldCount, " +
//                    "p.avg_rating AS avgRating " +
//                    "FROM products p " +
//                    "LEFT JOIN productvariants pv ON p.id = pv.Products_id " +
//                    "GROUP BY p.id";
//
//            return handle.createQuery(sql)
//                    .mapToBean(ProductDTO.class)
//                    .list();
//        });
//    }
//
//    public List<ProductDTO> getHeadphonesByPage(int limit, int offset) {
//        return get().withHandle(handle -> {
//            String sql = "SELECT p.id, " +
//                    "p.NAME AS name, " +
//                    "pv.main_image_url AS mainImageUrl, " +
//                    "pv.market_price AS marketPrice, " +
//                    "pv.sell_price AS sellPrice, " +
//                    "p.sold_count AS soldCount, " +
//                    "p.avg_rating AS avgRating " +
//                    "FROM products p " +
//                    "LEFT JOIN productvariants pv ON p.id = pv.Products_id " +
//                    "WHERE p.NAME LIKE 'Tai nghe%' " +
//                    "GROUP BY p.id " +
//                    "LIMIT :limit OFFSET :offset";
//
//            return handle.createQuery(sql)
//                    .bind("limit", limit)
//                    .bind("offset", offset)
//                    .mapToBean(ProductDTO.class)
//                    .list();
//        });
//    }
//
//    public int countTotalHeadphones() {
//        return get().withHandle(handle ->
//                handle.createQuery("SELECT COUNT(DISTINCT id) FROM products WHERE NAME LIKE 'Tai nghe%'")
//                        .mapTo(Integer.class).one()
//        );
//    }
//
//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        List<Product> products = new ArrayList<>();
//        Product p = new Product();
//        p.setId(170);
//        p.setName("Sp_001");
//        p.setBrandId(1);
//        p.setCategoriesId(1);
//        p.setSku("SN-SN-99");
//        p.setCreatedAt(java.time.LocalDate.now());
//        products.add(p);
//        dao.insert(products);
//        System.out.println("Insert thành công!");
//    }
}


