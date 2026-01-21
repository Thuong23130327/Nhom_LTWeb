package service;

import dao.ProductDAO;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {

    private ProductDAO productDao;

    public ProductService() throws SQLException, ClassNotFoundException {
        productDao = new ProductDAO();
    }

    public List<Product> searchProductByText(String textSearch) {
        return productDao.searchProductByText(textSearch);
    }

    public int pageNeed(String cateId, int sizePerPage) {
        return productDao.pageNeed(cateId, sizePerPage);
    }

    //GET TOP 3
    public List<Product> getPerPageProduct(int numPerPage, int page, String cId) {
        if (cId != null) {
            return productDao.getPerPageProductByCategoryId(numPerPage, page, cId);
        }
        return productDao.getPerPageAllProduct(numPerPage, page);
    }


    //Thuong done
    public List<Product> getAllProduct() {
        return productDao.getAllProduct();
    }

    public List<Product> getProductByCategoryId(String cateId) {
        return productDao.getProductByCategoryId(cateId);
    }

    public Product getById(String pid) {
        Product p = productDao.getById(pid);
        return p != null ? p : null;
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ProductService ps = new ProductService();
        System.out.println(ps.searchProductByText("2"));
        System.out.println(ps.getAllProduct());

    }

    public boolean deleteProduct(String pid) {
        return productDao.deleteProduct(pid);
    }
}
