package model;
import java.time.LocalDate;

public class Product {

    private int id;
    private int brandId;
    private int categoriesId;
    private String sku;
    private String name;
    private String description;
    private float avgRating;
    private int soldCount;
    private boolean isActive;
    private double price;
    private LocalDate createdAt;
    private String img;

    public Product() {
    }

    public Product(int id, int brandId, int categoriesId, String sku, String name, String description, float avgRating, int soldCount, boolean isActive, double price, LocalDate createdAt) {
        this.id = id;
        this.brandId = brandId;
        this.categoriesId = categoriesId;
        this.sku = sku;
        this.name = name;
        this.description = description;
        this.avgRating = avgRating;
        this.soldCount = soldCount;
        this.isActive = isActive;
        this.price = price;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getCategoriesId() {
        return categoriesId;
    }

    public void setCategoriesId(int categoriesId) {
        this.categoriesId = categoriesId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(float avgRating) {
        this.avgRating = avgRating;
    }

    public int getSoldCount() {
        return soldCount;
    }

    public void setSoldCount(int soldCount) {
        this.soldCount = soldCount;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
