package dao;

import model.Product;
//import model.ProductDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProductDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    static Map<Integer, Product> data = new HashMap<>();

    public List<Product> getPageProduct() {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("Brands_id"), rs.getInt("Categories_id"),
                        rs.getString("sku"), rs.getString("name"), rs.getString("description"),
                        rs.getFloat("avg_rating"), rs.getInt("sold_count"), rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"),
                        rs.getDouble("display_market_price"), rs.getDouble("display_sell_price"), rs.getString("display_image_url"));
                list.add(p);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("Brands_id"), rs.getInt("Categories_id"),
                        rs.getString("sku"), rs.getString("name"), rs.getString("description"),
                        rs.getFloat("avg_rating"), rs.getInt("sold_count"), rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"), rs.getDouble("display_market_price"),
                        rs.getDouble("display_sell_price"), rs.getString("display_image_url"));
                list.add(p);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    public List<Product> getProductByCategoryId(String cateId) {
        List<Product> list = new ArrayList<>();
        String sql =
                "SELECT * FROM products WHERE Categories_id = ? OR\n" +
                        "Categories_id IN (SELECT id from categories WHERE Categories_id = ?);";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, cateId);
            ps.setString(2, cateId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getInt("Brands_id"),
                        rs.getInt("Categories_id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"),
                        rs.getDouble("display_market_price"),
                        rs.getDouble("display_sell_price"),
                        rs.getString("display_image_url"));
                list.add(p);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    //Lay sp tu prd id
    public Product getById(String id) {
        Product p = null;
        String sql = "SELECT * FROM Products WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product(rs.getInt("id"),
                        rs.getInt("Brands_id"),
                        rs.getInt("Categories_id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"),
                        rs.getDouble("display_market_price"),
                        rs.getDouble("display_sell_price"),
                        rs.getString("display_image_url"));
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public Product getByIdForCart(String id) {
        String sql = "SELECT id, sku, name, display_sell_price, display_image_url FROM Products WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        null,
                        null,
                        rs.getString("sku"),
                        rs.getString("name"),
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        rs.getDouble("display_sell_price"),
                        rs.getString("display_image_url")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Product> searchProductByText(String textSearch) {
        List<Product> list = new ArrayList<>();
        String sql = " SELECT p.* FROM products p JOIN brands b ON b.id = p.Brands_id JOIN categories c on c.id = p.Categories_id\n" +
                "  WHERE p.`name` LIKE ? or p.sku LIKE ?" +
                "or p.display_sell_price LIKE ? " +
                "or p.display_market_price LIKE ? " +
                "or b.`name` LIKE ? " +
                "or c.`name`like ? ;\n";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            for (int i = 1; i < 7; i++) {
                ps.setString(i, "%" + textSearch + "%");
            }
            ;
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getInt("Brands_id"),
                        rs.getInt("Categories_id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"),
                        rs.getDouble("display_market_price"),
                        rs.getDouble("display_sell_price"),
                        rs.getString("display_image_url"));
                list.add(p);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    public Map<Integer, Integer> getTotalStock() {
        Map<Integer, Integer> map = new HashMap<>();
        String sql = "SELECT Products_id, SUM(stock_quantity) FROM productvariants GROUP BY Products_id; ";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                map.put(rs.getInt(1), rs.getInt(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
        }
        return map;
    }

    public boolean deleteProduct(String pid) {

        String sql = " DELETE FROM productspecs WHERE Products_id = ? ;\n" +
                "        DELETE FROM productvariants WHERE Products_id =? ;\n" +
                "        DELETE FROM productgalleries WHERE Products_id = ?;";


        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);

            conn.setAutoCommit(false);
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                int afRow = ps.executeUpdate();
                if (afRow > 0) {
                    conn.commit();
                }
                return afRow > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public Map<Integer, Integer> getVarTotal() {
        Map<Integer, Integer> map = new HashMap<>();
        String sql = "SELECT Products_id, count(id) FROM productvariants GROUP BY Products_id; ";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                map.put(rs.getInt(1), rs.getInt(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
        }
        return map;
    }

    public List<Product> getPerPageProductByCategoryId(int numPerPage, int page, String cateId, String selectedSort) {
        List<Product> list = new ArrayList<>();
        StringBuffer sql = new StringBuffer(
                "SELECT * FROM products WHERE Categories_id = ? OR\n" +
                        "Categories_id IN (SELECT id from categories WHERE Categories_id = ?) ");

        if (selectedSort.equals("default")) {
            sql.append(" ORDER BY id ");
        } else if (selectedSort.equals("price-asc")) {
            sql.append(" ORDER BY  display_sell_price asc ");
        }else if (selectedSort.equals("price-desc")) {
            sql.append(" ORDER BY  display_sell_price desc ");
        }
        sql.append(" LIMIT ? OFFSET ?");

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(String.valueOf(sql));
            ps.setString(1, cateId);
            ps.setString(2, cateId);
            ps.setInt(3, numPerPage);
            ps.setInt(4, (page - 1) * numPerPage);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getInt("Brands_id"),
                        rs.getInt("Categories_id"),
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("avg_rating"),
                        rs.getInt("sold_count"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"),
                        rs.getDouble("display_market_price"),
                        rs.getDouble("display_sell_price"),
                        rs.getString("display_image_url"));
                list.add(p);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public List<Product> getPerPageAllProduct(int numPerPage, int page, String selectedSort) {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Products") ;
        if (selectedSort.equals("default")) {
            sql.append(" ORDER BY id ");
        } else if (selectedSort.equals("price-asc")) {
            sql.append(" ORDER BY  display_sell_price asc ");
        }else if (selectedSort.equals("price-desc")) {
            sql.append(" ORDER BY  display_sell_price desc ");
        }
        sql.append(" LIMIT ? OFFSET ?");
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(String.valueOf(sql));
            ps.setInt(1, numPerPage);
            ps.setInt(2, (page - 1) * numPerPage);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("Brands_id"), rs.getInt("Categories_id"),
                        rs.getString("sku"), rs.getString("name"), rs.getString("description"),
                        rs.getFloat("avg_rating"), rs.getInt("sold_count"), rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"),
                        rs.getDouble("display_market_price"), rs.getDouble("display_sell_price"), rs.getString("display_image_url"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return list;
    }


    public int pageNeed(String cateId, int sizePerPage) {
        if (cateId == null || cateId.equals("0")) {
            System.out.println("Tong so trang: " + (int) getAllProduct().size() / sizePerPage + "all: " + getAllProduct().size());
            return (int) getAllProduct().size() / sizePerPage + 1;
        } else {
            System.out.println("Tong so trang: " + (int) getProductByCategoryId(cateId).size() / sizePerPage + "all: " + getProductByCategoryId(cateId).size());
            return (int) getProductByCategoryId(cateId).size() / sizePerPage + 1;
        }
    }

    private List<String> getListCategoryIdsIncludingChildren(String[] cateIds) {
        Set<String> allCategoryIds = new HashSet<>();
        if (cateIds == null || cateIds.length == 0)
            return new ArrayList<>();
        Collections.addAll(allCategoryIds, cateIds);
        StringBuilder sql = new StringBuilder("SELECT id FROM Categories WHERE Categories_id IN (");
        for (int i = 0; i < cateIds.length; i++) {
            sql.append(cateIds[i]);
            if (i < cateIds.length - 1) sql.append(",");
        }
        sql.append(")");

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(String.valueOf(sql));
            rs = ps.executeQuery();
            while (rs.next()) {
                allCategoryIds.add(String.valueOf(rs.getInt("id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<>(allCategoryIds);
    }

    public List<Product> filterProduct(String[] brandIds, String[] cateIds, int numPerPage, int page, String selectedSort) {


        List<Product> list = new ArrayList<>();
        StringBuffer sql = new StringBuffer("SELECT * FROM Products where 1=1 ");
        if (brandIds.length > 0) {
            sql.append(" and Brands_id in (");
            for (int i = 0; i < brandIds.length; i++) {
                sql.append(brandIds[i]);
                if (i < brandIds.length - 1) sql.append(",");
            }
            sql.append(") ");
        }

        if (cateIds.length > 0) {
            List<String> allCateIds = getListCategoryIdsIncludingChildren(cateIds);
            if (!allCateIds.isEmpty()) {
                sql.append(" and Categories_id in (");
                for (int i = 0; i < allCateIds.size(); i++) {
                    sql.append(allCateIds.get(i));
                    if (i < allCateIds.size() - 1) sql.append(",");
                }
                sql.append(") ");
            }
        }

        if (selectedSort.equals("default")) {
            sql.append(" ORDER BY id ");
        } else if (selectedSort.equals("price-asc")) {
            sql.append(" ORDER BY  display_sell_price asc ");
        }else if (selectedSort.equals("price-desc")) {
            sql.append(" ORDER BY  display_sell_price desc ");
        }
        sql.append(" LIMIT ? OFFSET ?");
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(String.valueOf(sql));
            ps.setInt(1, numPerPage);
            ps.setInt(2, (page - 1) * numPerPage);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("Brands_id"), rs.getInt("Categories_id"),
                        rs.getString("sku"), rs.getString("name"), rs.getString("description"),
                        rs.getFloat("avg_rating"), rs.getInt("sold_count"), rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at"), rs.getDouble("display_market_price"), rs.getDouble("display_sell_price"),
                        rs.getString("display_image_url"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}


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

