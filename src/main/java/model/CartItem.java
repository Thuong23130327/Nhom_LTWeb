package model;

import java.io.Serializable;

public class CartItem implements Serializable {
	private Product product;
	private int quantity;
	private double price;
	private boolean isChecked = true;

	public CartItem() {
	}
	public CartItem(Product product, int quantity, double price) {
		this.product = product;
		this.quantity = quantity;
		this.price = price;
	}

	public CartItem(int variantId, String productName, int quantity, double price) {
	}



	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
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

	public boolean isChecked() {
		return isChecked;
	}

	public void setChecked(boolean checked) {
		isChecked = checked;
	}

	// Tính tổng tiền món hàng * số lượng
	public double getTotalItemPrice() {
		return this.price * this.quantity;
	}
	public void upQuantity(int quantity){
		this.quantity += quantity;
	}

















}
