package service;

import dao.ProductDAO;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {

    private ProductDAO productDao;

    public ProductService() throws SQLException {
        productDao = new ProductDAO();
    }

    public List<Product> getNewArrivals(int limit) {
        return productDao.getNewArrivals(limit);
    }

    public List<Product> getProductsByCategory(int categoryId) {
        return productDao.getProductsByCategory(categoryId);
    }

    public Product getProduct(int id) {
        return null;
    }

    public List<Product> getAllProduct() {
        return null;
    }
}
