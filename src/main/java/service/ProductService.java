package service;

import dao.ProductDAO;
import model.Product;
import model.ProductDTO;

import java.sql.SQLException;
import java.util.List;

public class ProductService {

    private ProductDAO productDao;

    public ProductService() throws SQLException, ClassNotFoundException {
        productDao = new ProductDAO();
    }
//
//    public List<Product> getNewArrivals(int limit) {
//        return productDao.getNewArrivals(limit);
//    }
//
//    public List<Product> getProductsByCategory(int categoryId) {
//        return productDao.getProductsByCategory(categoryId);
//    }
//
//    public Product getProduct(int id) {
//        return null;
//    }
//
//    public List<ProductDTO> getListProductDTO() {
//        return productDao.getProductDTOs();
//    }
//
//    public List<ProductDTO> getHeadphonesPage(int page, int pageSize) {
//        int offset = (page - 1) * pageSize;
//        return productDao.getHeadphonesByPage(pageSize, offset);
//    }
//
//    public int getTotalHeadphonesPages(int pageSize) {
//        int total = productDao.countTotalHeadphones();
//        return (int) Math.ceil((double) total / pageSize);
//    }
//Thuong done
    public List<Product> getAllProduct() {
        return productDao.getAllProduct();
    }
    public List<Product> getProductByCategoryId(String cateId) {
        return productDao.getProductByCategoryId(cateId);
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ProductService ps = new ProductService();
        System.out.println(ps.getAllProduct());

    }
}
