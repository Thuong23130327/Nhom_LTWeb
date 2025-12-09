package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Item> items;

//Constructor
    public Cart() {
        this.items = new ArrayList<>();
    }

//Getters & Setters
    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

//Tìm sản phẩm trong giỏ hàng theo ID
    public Item getItemById(int id) {
        for (Item item : items) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

//Thêm hàng vào giỏ, nếu có sẵn sản phẩm sẽ cộng dồn
    public void addItem(Item newItem) {
        Item existingItem = getItemById(newItem.getProduct().getId());
        if (existingItem != null) {
            // Nếu đã tồn tại sản phẩm -> Cộng dồn
            existingItem.setQuantity(existingItem.getQuantity() + newItem.getQuantity());
        } else {
            // Thêm mới nếu chưa có
            items.add(newItem);
        }
    }
//Giảm số lượng sản phẩm & xóa sản phẩm khỏi giỏ hàng nếu số lượng = 0 theo ID
    public void removeItem(int id) {
        Item existingItem = getItemById(id);
        if (existingItem != null) {
            //Số lượng hiện tại
            int currentQuantity = existingItem.getQuantity();
            // Giảm số lượng
            int newQuantity = currentQuantity - 1;
            if (newQuantity <= 0) {
                // Nếu số lượng về 0 hoặc âm, xóa khỏi giỏ
                items.remove(existingItem);
            } else {
                // Cập nhật số lượng
                existingItem.setQuantity(newQuantity);
            }
        }
    }
//Tính tổng tiền cả giỏ hàng
    public double getTotalMoney() {
        double total = 0;
        for (Item item : items) {
            total += item.getTotalPrice(); // Sử dụng phương thức tiện ích từ Item
        }
        return total;
    }
}
