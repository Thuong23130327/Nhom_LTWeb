package service;

import dao.ProductDAO;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private Product product;
    private ProductDAO productDao;

    public ProductService() throws SQLException {
        productDao = new ProductDAO();
    }

    public ProductService(Product product, ProductDAO productDao) {
        this.product = product;
        this.productDao = productDao;
    }

    public Product getProduct(int id) {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Product> getNewArrivals(int limit) {
        return productDao.getNewArrivals(limit);
    }

    public List<Product> getProductsByCategory(int categoryId) {
        return productDao.getProductsByCategory(categoryId);
    }

}
