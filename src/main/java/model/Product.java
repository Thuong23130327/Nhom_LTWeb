package model;
import java.time.LocalDate;

public class Product {

    private int id;
    private String sku;
    private String name;
    private double price;
    private String description;
    private float avgRating;
    private int soldCount;
    private int brandId;
    private int categoriesId;
    private boolean isActive;
    private LocalDate createdAt;
    private String img;

    public Product(int id, String sku, String name, String description, float avgRating, int soldCount, int brandId, int categoriesId, boolean isActive, LocalDate createdAt, String img, double price) {
        this.id = id;
        this.sku = sku;
        this.name = name;
        this.price = price;
        this.description = description;
        this.avgRating = avgRating;
        this.soldCount = soldCount;
        this.brandId = brandId;
        this.categoriesId = categoriesId;
        this.isActive = isActive;
        this.createdAt = createdAt;
        this.img = img;
        this.price = price;
    }

    public Product(int id, String sku, String name, String description, float avgRating, int soldCount, int brandId, int categoriesId, boolean isActive, LocalDate createdAt) {
    }

    public Product(int id, String sku, String name, double price, String description, float avgRating, int soldCount, int brandId, int categoriesId, boolean isActive, LocalDate createdAt) {
        this.id = id;
        this.sku = sku;
        this.name = name;
        this.price = price;
        this.description = description;
        this.avgRating = avgRating;
        this.soldCount = soldCount;
        this.brandId = brandId;
        this.categoriesId = categoriesId;
        this.isActive = isActive;
        this.createdAt = createdAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
