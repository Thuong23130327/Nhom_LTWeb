package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<Integer, CartItem> items;

//Constructor
	public Cart(Map<Integer, CartItem> items) {
		super();
		this.items = items;
	}

	public Cart() {
		this.items = new HashMap<>();
	}

	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public void setItems(Map<Integer, CartItem> items) {
		this.items = items;
	}

	// Thêm hàng vào giỏ, nếu có sẵn sản phẩm sẽ cộng dồn
	public void addItem(CartItem newItem) {
		int id = newItem.getVariantId();
		if (items.containsKey(id)) {
			CartItem existItem = items.get(id);
			existItem.setQuantity(existItem.getQuantity() + newItem.getQuantity());
		} else {
			items.put(id, newItem);
		}
	}

	// Giảm số lượng sản phẩm
	public void removeItem(CartItem newItem) {
		int id = newItem.getVariantId();
		if (items.containsKey(id)) {
			CartItem existItem = items.get(id);
			if (existItem.getQuantity() > 1) {
				existItem.setQuantity(existItem.getQuantity() - newItem.getQuantity());
			}
		}
	}

	// Tính tổng tiền cả giỏ hàng
	public double getTotalMoney() {
		double total = 0;
		for (CartItem item : items.values()) {
			total += item.getTotalItemPrice();
		}
		return total;
	}
}
