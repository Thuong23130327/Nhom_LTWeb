package model;

public class OrderItems {
    private int id;
    private int ordersId;
    private int productVariantsId;
    private int quantity;
    private double price_at_purchase;

//Constructor
    public OrderItems() {
    }

    public OrderItems(int id, int ordersId, int productVariantsId, int quantity, double price_at_purchase) {
        this.id = id;
        this.ordersId = ordersId;
        this.productVariantsId = productVariantsId;
        this.quantity = quantity;
        this.price_at_purchase = price_at_purchase;
    }

//Getters & Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }

    public int getProductVariantsId() {
        return productVariantsId;
    }

    public void setProductVariantsId(int productVariantsId) {
        this.productVariantsId = productVariantsId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice_at_purchase() {
        return price_at_purchase;
    }

    public void setPrice_at_purchase(double price_at_purchase) {
        this.price_at_purchase = price_at_purchase;
    }
}
