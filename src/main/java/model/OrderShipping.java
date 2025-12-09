package model;

public class OrderShipping {
    private int id; // shipping_id PK
    private int orderId;
    private String recipientName;
    private String phone;
    private String address;
    private String city;
    private String note;

    public OrderShipping() {}

    // Constructor tạo mới
    public OrderShipping(int orderId, String recipientName, String phone, String address, String city, String note) {
        this.orderId = orderId;
        this.recipientName = recipientName;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.note = note;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
}