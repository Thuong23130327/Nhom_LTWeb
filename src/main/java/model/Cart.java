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
    //Lấy số lượng của 1 sản phẩm
    public void addOrUpdateItem(String productName,ProductVariant productVariant, int quantity) {
        if (productVariant == null) return; // Chống sập nếu biến thể bị null
        if (items.containsKey(productVariant.getId())) {
            CartItem item = items.get(productVariant.getId());
            item.upQuantity(quantity);
            // Nếu số lượng về 0 hoặc nhỏ hơn (do nhấn nút giảm), xóa khỏi giỏ
            if (item.getQuantity() <= 0) {
                items.remove(productVariant.getId());
            }
        } else {
            if (quantity > 0) {
                // Sử dụng sellPrice từ lớp Product bạn đã cung cấp
                items.put(productVariant.getId(), new CartItem(productName, productVariant, quantity));
            }
        }
    }
    //Lấy ds sản phẩm
    public List<CartItem> getListItems(){
        return new ArrayList<>(items.values());
    }
    //Lấy tổng số lượng sp
    public int getTotalQuantity(){
        AtomicInteger total = new AtomicInteger();
        items.values().forEach((CartItem c) -> {
            if (c.isChecked()) { // Chỉ cộng dồn nếu sản phẩm được tick
                total.addAndGet(c.getQuantity());
            }
        });
        return total.get();
    }
    //Lấy tổng giá tiền
    public double getTotalPrice(){
        AtomicReference<Double> sum = new AtomicReference<>((double) 0);
        items.values().forEach(c-> {
            if (c.isChecked()) { // Chỉ tính tiền nếu sản phẩm được tick
                sum.updateAndGet(v -> v + (c.getPrice() * c.getQuantity()));
            }
        });
        return sum.get();
    }
}