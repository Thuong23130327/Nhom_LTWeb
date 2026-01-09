package service;

import java.sql.SQLException;
import java.util.List;

import dao.GalleryDAO;
import dao.ProductDAO;
import dao.SpecDAO;
import dao.VariantDAO;
import model.Product;
import model.ProductDTO;
import model.ProductSpec;
import model.ProductVariant;

public class ProductDetailService {
    private ProductDAO productDAO = new ProductDAO();
    private VariantDAO variantDAO = new VariantDAO();
    private SpecDAO specDAO = new SpecDAO();
    private GalleryDAO galleryDAO = new GalleryDAO();

    public ProductDetailService() throws SQLException, ClassNotFoundException {
    }


    public ProductVariant getVariantByImg(List<ProductVariant> list, String img) throws SQLException, ClassNotFoundException {
        if (list == null || list.isEmpty()) {
            return null;
        }
        for (ProductVariant productVariant : list) {
            if (productVariant.getMainImageUrl() != null && productVariant.getMainImageUrl().equalsIgnoreCase(img)) {
                return productVariant;
            }
        }
        return list.get(0);
    }


    public List<ProductVariant> getAllVariantByProductId(String productId) throws SQLException, ClassNotFoundException {
        List<ProductVariant> variants = variantDAO.getVariantsByProductId(productId);
        return variants != null ? variants : null;
    }


    public List<ProductSpec> getAllSpecByProductId(String productId) throws SQLException, ClassNotFoundException {
        List<ProductSpec> specs = specDAO.getSpecsByProductId(productId);
        return specs != null ? specs : null;
    }

    public List<String> getImageByProductId(String productId) throws SQLException, ClassNotFoundException {
        List<String> images = galleryDAO.getImagesByProductId(productId);
        return images != null ? images : null;
    }


}
