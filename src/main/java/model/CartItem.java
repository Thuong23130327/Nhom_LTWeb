package model;

public class CartItem {
	private int variantId;
	private String productName;
	private int quantity;
	private double price;

	public CartItem(int variantId, String productName, int quantity, double price) {
		super();
		this.variantId = variantId;
		this.productName = productName;
		this.quantity = quantity;
		this.price = price;
	}

	public CartItem() {
	}

	public int getVariantId() {
		return variantId;
	}

	public void setVariantId(int variantId) {
		this.variantId = variantId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		if (quantity > 0) {
			this.quantity = quantity;
		}
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	// Tính tổng tiền món hàng * số lượng
	public double getTotalItemPrice() {
		return this.price * this.quantity;
	}

}
