package dao;

import model.Product;
import model.ProductDTO;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.PreparedBatch;
import org.w3c.dom.CDATASection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO extends BaseDAO{
    private Connection conn;
    static Map<Integer, Product> data = new HashMap<>();
    static {
        // 1. Sản phẩm Sony WH-1000XM5
        Product p1 = new Product(
                1, 1, 4, "SN-XM5", "Sony WH-1000XM5",
                "Tai nghe Sony WH-1000XM5 - Chống ồn đỉnh cao, thời lượng pin 30 giờ...",
                5.0f, 120, true, 7900000.0, java.time.LocalDate.now()
        );
        p1.setImg("https://cdn2.cellphones.com.vn/358x/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-1000xm5-3_1.png");
        data.put(p1.getId(), p1);

        // 2. Sản phẩm Loa JBL Flip 6
        Product p2 = new Product(
                2, 2, 5, "JBL-F6", "Loa Bluetooth JBL Flip 6",
                "Thiết kế nhỏ gọn, âm thanh mạnh mẽ, chống nước IP67...",
                4.8f, 85, true, 2500000.0, java.time.LocalDate.now()
        );
        p2.setImg("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/j/b/jbl_flip_6_9.png");
        data.put(p2.getId(), p2);

        // 3. Sản phẩm Loa Sony SRS-XE200
        Product p3 = new Product(
                3, 1, 5, "S-SRS-XE200", "Sony SRS-XE200",
                "Loa di động Sony, âm thanh khuếch đại rộng, pin 16 giờ...",
                4.5f, 40, true, 1150000.0, java.time.LocalDate.now()
        );
        p3.setImg("https://cdn2.cellphones.com.vn/358x/media/catalog/product/x/e/xe200_xam_1.jpg");
        data.put(p3.getId(), p3);
    }

//    public  ProductDAO() throws SQLException {
//        conn = DBConnect.getConnection();
//    }
    public ProductDAO() {
        try {
            conn = DBConnect.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
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
                        rs.getInt("brand_id"),
                        rs.getInt("categories_id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getBoolean("is_active"),
                        rs.getDouble("price"),
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
                            rs.getInt("brand_id"),
                            rs.getInt("categories_id"),
                            rs.getString("sku"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getFloat("avg_rating"),
                            rs.getInt("sold_count"),
                            rs.getBoolean("is_active"),
                            rs.getDouble("price"),
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
               brand_id, categories_id, is_active, created_at, img, price
        FROM Products
        ORDER BY created_at DESC
        LIMIT ?
    """;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add( new Product(
                        rs.getInt("id"),
                        rs.getInt("brand_id"),
                        rs.getInt("categories_id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getBoolean("is_active"),
                        rs.getDouble("price"),
                        rs.getDate("created_at").toLocalDate()
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsByCategory(int idCategory) {
        List<Product> list = new ArrayList<>();
        // Thêm 'price' và 'img' vào câu query
        String sql = """
        SELECT id, sku, name, description, avg_rating, sold_count,
               brand_id, categories_id, is_active, created_at, price, img
        FROM Products
        WHERE categories_id = ?""";
        try (Connection conn = DBConnect.getConnection(); // Đảm bảo lấy connection ở đây
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idCategory);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Sử dụng constructor đầy đủ (bao gồm img và price)
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getInt("brand_id"),
                        rs.getInt("categories_id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getBoolean("is_active"),
                        rs.getDouble("price"),
                        rs.getDate("created_at").toLocalDate()
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getListProduct() {
        return get().withHandle(h -> h.createQuery("select * from products").mapToBean(Product.class).list());
    }
    public Product getProduct(int id) {
        return get().withHandle(h -> h.createQuery("select * from products where id = :id").bind("id", id).mapToBean(Product.class).stream().findFirst().orElse(null));
    }
    public void insert(List<Product> products){
        get().useHandle(h->{
            String sql = "INSERT INTO products (id, Brands_id, Categories_id, sku, NAME, description, avg_rating, sold_count, is_active, created_at) " +
                    "VALUES (:id, :Brands_id, :Categories_id, :sku, :NAME, :description, :avg_rating, :sold_count, :is_active, :created_at)";

            PreparedBatch batch = h.prepareBatch(sql);

            for (Product p : products) {
                batch.bind("id", p.getId())
                        .bind("Brands_id", p.getBrandId())
                        .bind("Categories_id", p.getCategoriesId())
                        .bind("sku", p.getSku())
                        .bind("NAME", p.getName())
                        .bind("description", p.getDescription())
                        .bind("avg_rating", p.getAvgRating())
                        .bind("sold_count", p.getSoldCount())
                        .bind("is_active", p.isActive() ? 1 : 0)
                        .bind("created_at", p.getCreatedAt())
                        .add();
            }
            batch.execute();
        });
    }

    public List<ProductDTO> getProductDTOs() {
        return get().withHandle(handle -> {
            String sql = "SELECT p.id, " +
                    "p.NAME AS name, " + // Đổi NAME (DB) thành name (Java)
                    "pv.main_image_url AS mainImageUrl, " + // Đổi gạch dưới thành CamelCase
                    "pv.market_price AS marketPrice, " +
                    "pv.sell_price AS sellPrice, " +
                    "p.sold_count AS soldCount, " +
                    "p.avg_rating AS avgRating " +
                    "FROM products p " +
                    "LEFT JOIN productvariants pv ON p.id = pv.Products_id " +
                    "GROUP BY p.id";

            return handle.createQuery(sql)
                    .mapToBean(ProductDTO.class)
                    .list();
        });
    }

    public List<ProductDTO> getHeadphonesByPage(int limit, int offset) {
        return get().withHandle(handle -> {
            String sql = "SELECT p.id, " +
                    "p.NAME AS name, " +
                    "pv.main_image_url AS mainImageUrl, " +
                    "pv.market_price AS marketPrice, " +
                    "pv.sell_price AS sellPrice, " +
                    "p.sold_count AS soldCount, " +
                    "p.avg_rating AS avgRating " +
                    "FROM products p " +
                    "LEFT JOIN productvariants pv ON p.id = pv.Products_id " +
                    "WHERE p.NAME LIKE 'Tai nghe%' " +
                    "GROUP BY p.id " +
                    "LIMIT :limit OFFSET :offset";

            return handle.createQuery(sql)
                    .bind("limit", limit)
                    .bind("offset", offset)
                    .mapToBean(ProductDTO.class)
                    .list();
        });
    }

    public int countTotalHeadphones() {
        return get().withHandle(handle ->
                handle.createQuery("SELECT COUNT(DISTINCT id) FROM products WHERE NAME LIKE 'Tai nghe%'")
                        .mapTo(Integer.class).one()
        );
    }
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> products = new ArrayList<>();
        Product p = new Product();
        p.setId(170);
        p.setName("Sp_001");
        p.setBrandId(1);
        p.setCategoriesId(1);
        p.setSku("SN-SN-99");
        p.setCreatedAt(java.time.LocalDate.now());
        products.add(p);
        dao.insert(products);
        System.out.println("Insert thành công!");
    }
}


