package dao;

import model.Product;
import model.ProductVariant;
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

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRStoProduct(rs));
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
        } else if (selectedSort.equals("price-desc")) {
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

    private Product mapRStoProduct(ResultSet rs) throws SQLException {
        return new Product(rs.getInt("id"), rs.getInt("Brands_id"), rs.getInt("Categories_id"),
                rs.getString("sku"), rs.getString("name"), rs.getString("description"),
                rs.getFloat("avg_rating"), rs.getInt("sold_count"), rs.getBoolean("is_active"),
                rs.getTimestamp("created_at"),
                rs.getDouble("display_market_price"), rs.getDouble("display_sell_price"), rs.getString("display_image_url"));
    }

    public List<Product> getPerPageAllProduct(int numPerPage, int page, String selectedSort) {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Products");
        if (selectedSort.equals("default")) {
            sql.append(" ORDER BY id ");
        } else if (selectedSort.equals("price-asc")) {
            sql.append(" ORDER BY  display_sell_price asc ");
        } else if (selectedSort.equals("price-desc")) {
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
        StringBuilder sql = new StringBuilder("SELECT p.* FROM Products p ");
        sql.append("LEFT JOIN Brands b ON p.Brands_id = b.id ");
        sql.append("LEFT JOIN Categories c ON p.Categories_id = c.id ");
        sql.append("WHERE p.display_sell_price <> 0  ");
        sql.append("AND p.display_image_url IS NOT NULL  ");
        sql.append("AND TRIM(p.display_image_url) <> ''  ");
        if (brandIds != null && brandIds.length > 0) {
            sql.append(" AND p.Brands_id IN (");
            for (int i = 0; i < brandIds.length; i++) {
                sql.append(brandIds[i]);
                if (i < brandIds.length - 1) sql.append(",");
            }
            sql.append(") ");
        }
        if (cateIds != null && cateIds.length > 0) {
            List<String> allCateIds = getListCategoryIdsIncludingChildren(cateIds);
            if (!allCateIds.isEmpty()) {
                sql.append(" AND p.Categories_id IN (");
                for (int i = 0; i < allCateIds.size(); i++) {
                    sql.append(allCateIds.get(i));
                    if (i < allCateIds.size() - 1) sql.append(",");
                }
                sql.append(") ");
            }
        }
        if (selectedSort == null) {
            sql.append(" ORDER BY p.id DESC ");
        } else if (selectedSort.equals("price-asc")) {
            sql.append(" ORDER BY p.display_sell_price ASC ");
        } else if (selectedSort.equals("price-desc")) {
            sql.append(" ORDER BY p.display_sell_price DESC ");
        }
        if (page * numPerPage != 0)
            sql.append(" LIMIT ? OFFSET ?");

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql.toString());

            if (page * numPerPage != 0) {
                ps.setInt(1, numPerPage);
                ps.setInt(2, (page - 1) * numPerPage);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRStoProduct(rs));
            }
        } catch (SQLException |
                 ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getProductName(String pid) {
        String sql = "SELECT name FROM Products WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return "Không tìm thấy tên Sản phẩm";

    }

    // Cập nhật thông tin chung và xử lý Biến thể mặc định
    public boolean updateProductGeneral(Product p, int defaultVariantId) throws SQLException {
        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false); // Dùng Transaction để đảm bảo tính toàn vẹn

            // 1. Cập nhật bảng products
            String sqlProd = "UPDATE products SET name=?, sku=?, description=?, is_active=? WHERE id=?";
            PreparedStatement psProd = conn.prepareStatement(sqlProd);
            psProd.setString(1, p.getName());
            psProd.setString(2, p.getSku());
            psProd.setString(3, p.getDescription());
            psProd.setInt(4, p.isActive() ? 1 : 0);
            psProd.setInt(5, p.getId());
            psProd.executeUpdate();

            // 2. Reset tất cả biến thể của SP này về is_default = 0
            String sqlReset = "UPDATE product_variants SET is_default = 0 WHERE product_id = ?";
            PreparedStatement psReset = conn.prepareStatement(sqlReset);
            psReset.setInt(1, p.getId());
            psReset.executeUpdate();

            // 3. Set biến thể được chọn làm mặc định (is_default = 1)
            String sqlSetDef = "UPDATE product_variants SET is_default = 1 WHERE id = ?";
            PreparedStatement psSetDef = conn.prepareStatement(sqlSetDef);
            psSetDef.setInt(1, defaultVariantId);
            psSetDef.executeUpdate();

            // 4. Đồng bộ giá và ảnh từ biến thể mặc định sang bảng products
            String sqlSync = "UPDATE p SET p.oldPrice = v.market_price, p.sellPrice = v.sell_price, p.img = v.main_image_url " +
                    "FROM products p JOIN product_variants v ON p.id = v.product_id WHERE v.id = ?";
            PreparedStatement psSync = conn.prepareStatement(sqlSync);
            psSync.setInt(1, defaultVariantId);
            psSync.executeUpdate();

            conn.commit();
            return true;
        } catch (Exception e) {
            if (conn != null) conn.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) conn.close();
        }
    }

    // Thêm biến thể mới với SKU tự động
    public boolean insertVariant(ProductVariant v, String productSku) {
        String variantSku = productSku + "_" + v.getColorName().replaceAll("\\s+", ""); // Tự động tạo SKU
        String sql = "INSERT INTO product_variants (product_id, color_name, sku, market_price, sell_price, stock_quantity, main_image_url, is_default) VALUES (?, ?, ?, ?, ?, ?, ?, 0)";
        try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, v.getProductId());
            ps.setString(2, v.getColorName());
            ps.setString(3, variantSku);
            ps.setDouble(4, v.getMarketPrice());
            ps.setDouble(5, v.getSellPrice());
            ps.setInt(6, v.getStockQuantity());
            ps.setString(7, v.getMainImageUrl());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }// 1. Thêm ảnh mới vào Gallery

    public boolean insertProductImage(int pid, String imgPath) {
        String sql = "INSERT INTO product_images (product_id, image_url) VALUES (?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pid);
            ps.setString(2, imgPath);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 2. Lấy đường dẫn ảnh để xóa file vật lý
    public String getImagePathById(int imgId) {
        String sql = "SELECT image_url FROM product_images WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, imgId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getString("image_url");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 3. Xóa record ảnh trong Database
    public boolean deleteImageRecord(int imgId) {
        String sql = "DELETE FROM product_images WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, imgId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean updateProduct(String pid, String brandid, String cateid, String name, String sku, String discript, String varSelected, String isActive) throws SQLException {
        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);
            String sqlProduct = "UPDATE products SET brands_id = ?, categories_id =?, name=?, sku=?, description=?, is_active=? WHERE id=?";
            ps = conn.prepareStatement(sqlProduct);
            ps.setString(1, brandid);
            ps.setString(2, cateid);
            ps.setString(3, name);
            ps.setString(4, sku);
            ps.setString(5, discript);
            ps.setString(6, isActive);
            ps.setString(7, pid);
            ps.executeUpdate();

            String sqlResetDefault = " UPDATE productvariants SET is_default =0  WHERE products_id = ? ";
            java.sql.PreparedStatement ps3 = conn.prepareStatement(sqlResetDefault);
            ps3.setString(1, pid);
            ps3.executeUpdate();

            String sqlVarDefault = " UPDATE productvariants SET is_default =1  WHERE id=? ";
            java.sql.PreparedStatement ps2 = conn.prepareStatement(sqlVarDefault);
            ps2.setString(1, varSelected);
            ps2.executeUpdate();

            String sqlUpDisplayProd = "UPDATE products p " +
                    "JOIN productvariants v ON p.id = v.products_id " +
                    "SET p.display_image_url = v.main_image_url, " +
                    "    p.display_sell_price = v.sell_price, " +
                    "    p.display_market_price = v.market_price " +
                    "WHERE v.id = ? and p.id = ?";
            java.sql.PreparedStatement ps4 = conn.prepareStatement(sqlUpDisplayProd);
            ps4.setString(2, pid);
            ps4.setString(1, varSelected);
            ps4.executeUpdate();

            conn.commit();
            return true;

        } catch (Exception e) {
            conn.rollback();
            return false;
        } finally {
            conn.setAutoCommit(true);
            conn.close();

        }

    }

    public boolean updateSpecs(String[] inputSpecIds, String[] inputSpecValue) throws SQLException {
        try {
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false);
            String sqlProduct = "UPDATE productspecs SET spec_value= ? WHERE id=?";
            ps = conn.prepareStatement(sqlProduct);

            for (int i = 0; i < inputSpecIds.length; i++) {
                ps.setString(1, inputSpecValue[i]);
                ps.setString(2, inputSpecIds[i]);
                ps.addBatch();
            }
            ps.executeBatch();
            conn.commit();
            return true;

        } catch (Exception e) {
            conn.rollback();
            return false;
        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }
    }

}

