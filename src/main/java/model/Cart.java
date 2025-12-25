package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Cart implements Serializable {
	private Map<Integer, CartItem> items;

	//Constructor
	public Cart() {
		this.items = new HashMap<Integer, CartItem>();
	}


	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public void setItems(Map<Integer, CartItem> items) {
		this.items = items;
	}

// Thêm hàng vào giỏ, nếu có sẵn sản phẩm sẽ cộng dồn
	public void addItem(Product product, int quantity) {
		if (quantity <= 0) {
			quantity = 1;
		}
		if (items.containsKey(product.getId())) {
			items.get(product.getId()).upQuantity(quantity);
		} else {
			items.put(product.getId(), new CartItem(product, quantity, product.getPrice()));
		}
	}
//Cập nhật sp
	public void updateItems(Product product, int quantity) {
//		todo
	}
//Xóa sp
	public CartItem deleteItem(int id) {
		return items.remove(id);
	}
//Xóa toàn bộ sp ở giỏ
	public List<CartItem> deleteAllItems() {
		List<CartItem> allItems = new ArrayList<CartItem>(items.values());
		items.clear();
		return allItems;
    }
//Lấy ds sản phẩm
	public List<CartItem> getListItems(){
		return new ArrayList<>(items.values());
	}
//Lấy tổng số lượng sp
	public int getTotalQuantity(){
		AtomicInteger total = new AtomicInteger();
		items.values().forEach((CartItem c) -> total.addAndGet(c.getQuantity()));
		return total.get();
	}
//Lấy tổng giá tiền
	public double getTotalPrice(){
		AtomicReference<Double> sum = new AtomicReference<>((double) 0);
		items.values().forEach(c-> sum.updateAndGet(v -> v + (c.getPrice() * c.getQuantity())));
		return sum.get();
	}
}
