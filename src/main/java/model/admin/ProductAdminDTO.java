package model.admin;

public class ProductAdminDTO {
    private int productId;
    private String sku;
    private String name;
    private int stock;
    private double price;

    public ProductAdminDTO() {
    }

    public ProductAdminDTO(int productId, String sku, String name, int stock, double price) {
        this.productId = productId;
        this.sku = sku;
        this.name = name;
        this.stock = stock;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
