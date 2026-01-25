package model;

public class CheckoutItemDTO {
    private CartItem cartItem;
    private String productName;

    public CheckoutItemDTO(CartItem cartItem, String productName) {
        this.cartItem = cartItem;
        this.productName = productName;
    }

    public CartItem getCartItem() {
        return cartItem;
    }

    public String getProductName() {
        return productName;
    }
}