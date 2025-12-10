package model;

public class ProductVariant {

    private int id;
    private int productId;
    private String variantSku;
    private String colorName;
    private String mainImageUlr;
    private double marketPrice;
    private double sellPrice;
    private int stockQuantity;
    private int soldQuantity;

    public ProductVariant(int id, int productId, String variantSku, String colorName, String mainImageUlr,
                          double marketPrice, double sellPrice, int stockQuantity, int soldQuantity) {
        super();
        this.id = id;
        this.productId = productId;
        this.variantSku = variantSku;
        this.colorName = colorName;
        this.mainImageUlr = mainImageUlr;
        this.marketPrice = marketPrice;
        this.sellPrice = sellPrice;
        this.stockQuantity = stockQuantity;
        this.soldQuantity = soldQuantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getVariantSku() {
        return variantSku;
    }

    public void setVariantSku(String variantSku) {
        this.variantSku = variantSku;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public String getMainImageUlr() {
        return mainImageUlr;
    }

    public void setMainImageUlr(String mainImageUlr) {
        this.mainImageUlr = mainImageUlr;
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

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

}
