package service;

import dao.GalleryDAO;
import dao.ProductDAO;
import dao.SpecDAO;
import dao.VariantDAO;
import model.Product;
import model.ProductSpec;
import model.ProductVariant;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AdminProductService {
    private ProductDAO productDAO = new ProductDAO();
    private VariantDAO variantDAO = new VariantDAO();
    private SpecDAO specDAO = new SpecDAO();
    private GalleryDAO galleryDAO = new GalleryDAO();




    public AdminProductService() throws SQLException, ClassNotFoundException {
    }

    public List<Product> searchProductByText(String textSearch) {
        return productDAO.searchProductByText(textSearch);
    }
    public List<Product> getAllProduct() {
        return productDAO.getAllProduct();
    }

    public Map<Integer, Integer> getTotalStock() {
        return productDAO.getTotalStock();
    }



}
