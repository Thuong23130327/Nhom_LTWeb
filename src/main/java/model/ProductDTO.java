package model;

public class ProductDTO {
    private int id;
    private String name;
    private String mainImageUrl;
    private double marketPrice;
    private double sellPrice;
    private int soldCount;
    private float avgRating;

    public ProductDTO() {
    }

    public ProductDTO(int id, String name, String mainImageUrl, double marketPrice, double sellPrice, int soldCount, float avgRating) {
        this.id = id;
        this.name = name;
        this.mainImageUrl = mainImageUrl;
        this.marketPrice = marketPrice;
        this.sellPrice = sellPrice;
        this.soldCount = soldCount;
        this.avgRating = avgRating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMainImageUrl() {
        return mainImageUrl;
    }

    public void setMainImageUrl(String mainImageUrl) {
        this.mainImageUrl = mainImageUrl;
    }

    public double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public double getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(double sellPrice) {
        this.sellPrice = sellPrice;
    }

    public int getSoldCount() {
        return soldCount;
    }

    public void setSoldCount(int soldCount) {
        this.soldCount = soldCount;
    }

    public float getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(float avgRating) {
        this.avgRating = avgRating;
    }
}

