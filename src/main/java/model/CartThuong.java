package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class CartThuong implements Serializable {
    
    private Map<Integer, CartItemThuong> items;

    //Constructor
    public CartThuong() {
        this.items = new HashMap<Integer, CartItemThuong>();
    }


    public Map<Integer, CartItemThuong> getItems() {
        return items;
    }

    public void setItems(Map<Integer, CartItemThuong> items) {
        this.items = items;
    }

//Cập nhật sp
    public void updateItems(Product product, int quantity) {
//		todo
    }

    //Xóa sp
    public CartItemThuong deleteItem(int id) {
        return items.remove(id);
    }

    //Xóa toàn bộ sp ở giỏ
    public List<CartItemThuong> deleteAllItems() {
        List<CartItemThuong> allItems = new ArrayList<CartItemThuong>(items.values());
        items.clear();
        return allItems;
    }
//Lấy số lượng của 1 sản phẩm
//	public void addOrUpdateItem(Product product, int quantity) {
//		if (items.containsKey(product.getId())) {
//			CartItemThuong item = items.get(product.getId());
//			item.upQuantity(quantity);
//			// Nếu số lượng về 0 hoặc nhỏ hơn (do nhấn nút giảm), xóa khỏi giỏ
//			if (item.getQuantity() <= 0) {
//				items.remove(product.getId());
//			}
//		} else {
//			if (quantity > 0) {
//				// Sử dụng sellPrice từ lớp Product bạn đã cung cấp
//				items.put(product.getId(), new CartItemThuong(product, quantity, product.getSellPrice()));
//			}
//		}
//	}

    public void addItem(String name, ProductVariant pv, int quantity) {
        if (pv == null) return; // Chống sập nếu biến thể bị null
        if (items.containsKey(pv.getId())) {
            CartItemThuong item = items.get(pv.getId());
            item.upQuantity(quantity);
        } else {
            items.put(pv.getId(), new CartItemThuong(name, pv, quantity));
        }
    }

    //    public void addOrUpdateItem(ProductVariant pv, int quantity) {
//        if (items.containsKey(pv.getId())) {
//            CartItemThuong item = items.get(pv.getId());
//            item.upQuantity(quantity);
//        } else {
//            if (quantity > 0) {
//                // Sử dụng sellPrice từ lớp Product bạn đã cung cấp
//                items.put(product.getId(), new CartItemThuong(product, quantity, product.getSellPrice()));
//            }
//        }
//    }
//Lấy ds sản phẩm
    public List<CartItemThuong> getListItems() {
        if (items == null) return new ArrayList<>();
        return new ArrayList<>(items.values());
    }

    //Lấy tổng số lượng sp
    public int getTotalQuantity() {
        AtomicInteger total = new AtomicInteger();
        items.values().forEach((CartItemThuong c) -> {
            if (c.isChecked()) { // Chỉ cộng dồn nếu sản phẩm được tick
                total.addAndGet(c.getQuantity());
            }
        });
        return total.get();
    }

    //Lấy tổng giá tiền
    public double getTotalPrice() {
        AtomicReference<Double> sum = new AtomicReference<>((double) 0);
        items.values().forEach(c -> {
            if (c.isChecked()) { // Chỉ tính tiền nếu sản phẩm được tick
                sum.updateAndGet(v -> v + (c.getPrice() * c.getQuantity()));
            }
        });
        return sum.get();
    }

}
