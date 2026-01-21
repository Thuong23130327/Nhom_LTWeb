package model;

import java.io.Serializable;

public class CartItemThuong implements Serializable {
    private String name;
    private ProductVariant productVariant;
    private int quantity;
    private double price;
    private double oldPrice ;
    private String img;
    private boolean isChecked = true;

    public CartItemThuong() {
    }


    public String getImg() {
        return img;
    }


    public void setImg(String img) {
        this.img = img;
    }

    public CartItemThuong(String name, ProductVariant pv, int quantity) {
        this.name = name;
        this.productVariant = pv;
        this.quantity = quantity;
        this.price = productVariant.getSellPrice();
        this.oldPrice= productVariant.getMarketPrice();
        this.img = productVariant.getMainImageUrl();
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public ProductVariant getProductVariant() {
        return productVariant;
    }


    public void setProductVariant(ProductVariant productVariant) {
        this.productVariant = productVariant;
    }


    public double getOldPrice() {
        return oldPrice;
    }


    public void setOldPrice(double oldPrice) {
        this.oldPrice = oldPrice;
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
