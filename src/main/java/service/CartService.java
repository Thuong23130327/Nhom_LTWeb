package service;

import dao.VariantDAO;
import model.Cart;
import model.CartItem;
import model.Product;
import model.ProductVariant;

import java.sql.SQLException;
import java.util.List;

public class CartService {
    private static VariantDAO variantDAO = new VariantDAO();
    private ProductService productService = new ProductService();

    public CartService() throws SQLException, ClassNotFoundException {

    }

    public static ProductVariant getProductVariant(String variantId) {
        return variantDAO.getProductVariant(variantId);
    }

    public List<ProductVariant> getVariantsByProductId(int productId) {
        return variantDAO.getVariantsByProductId(String.valueOf(productId));
    }

    public Product getProductById(String id) {
        return productService.getById(id);
    }

    // Cập nhật biến thể
    public boolean updateVariant(Cart cart, int oldVid, String newVidStr) {
        if (cart == null) return false;

        if (!cart.getItems().containsKey(oldVid)) {
            return false;
        }

        CartItem oldItem = cart.getItems().get(oldVid);
        ProductVariant newVariant = getProductVariant(newVidStr);

        if (oldItem != null && newVariant != null) {
            int quantity = oldItem.getQuantity();
            // Xóa biến thể cũ khỏi Map items
            cart.getItems().remove(oldVid);
            // Thêm biến thể mới vào cart (Dùng hàm addOrUpdateItem trongg Cart)
            cart.addOrUpdateItem(oldItem.getName(), newVariant, oldItem.getQuantity());
            return true;
        }
        return false;
    }

}
