package service;

import dao.VariantDAO;
import model.ProductVariant;

import java.util.List;

public class ProductVariantService {
    private VariantDAO variantDAO = new VariantDAO();

    // Lấy ds biến thể
    public List<ProductVariant> getVariantsByProductId(String productId) {
        return variantDAO.getVariantsByProductId(productId);
    }

    // Lấy chi tiết 1 biến thể
    public ProductVariant getProductVariant(String variantId) {
        return variantDAO.getProductVariant(variantId);
    }
}
