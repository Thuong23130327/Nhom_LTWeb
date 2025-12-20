package service;

import dao.ProductDAO;
import model.Product;

import java.util.List;

public class ProductService {

    private ProductDAO productDao;

    public ProductService() {
        productDao = new ProductDAO();
    }

    public List<Product> getNewArrivals(int limit) {
        return productDao.getNewArrivals(limit);
    }

    public List<Product> getProductsByCategory(int categoryId) {
        return productDao.getProductsByCategory(categoryId);
    }

}
