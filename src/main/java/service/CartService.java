package service;

import dao.VariantDAO;
import model.ProductVariant;

public class CartService {
    private VariantDAO variantDAO = new VariantDAO();

    public CartService() {

    }

    public ProductVariant getProductVariant(String variantId) {
        return variantDAO.getProductVariant(variantId);

    }

}
