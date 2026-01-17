package service;

import dao.ProductDAO;
import model.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AdminProductService {
    private ProductDAO productDao;


    public AdminProductService() throws SQLException, ClassNotFoundException {
        productDao = new ProductDAO();
    }

    public List<Product> getAllProduct() {
        return productDao.getAllProduct();
    }

    public Map<Integer, Integer> getTotalStock() {
        return productDao.getTotalStock();
    }


}
