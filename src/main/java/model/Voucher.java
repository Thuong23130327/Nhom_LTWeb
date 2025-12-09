package model;

import java.time.LocalDateTime;
public class Voucher {

    // Thuộc tính
    private int id; // voucher_id (PK, Tự động tạo)
    private String code; // Mã Voucher duy nhất (VARCHAR)
    private String description; // Mô tả Voucher (VARCHAR/TEXT)
    private String type; // Loại giảm giá: "PERCENT" (%), "FIXED_AMOUNT" (Số tiền cố định)
    private double discountValue; // Giá trị giảm giá (Ví dụ: 10.0 cho 10% hoặc 50000 cho 50,000 VND)
    private double minimumOrderAmount; // Giá trị đơn hàng tối thiểu để áp dụng
    private int usageLimit; // Số lần Voucher có thể được sử dụng (Tổng cộng)
    private int usedCount; // Số lần Voucher đã được sử dụng
    private LocalDateTime validFrom; // Ngày bắt đầu hiệu lực
    private LocalDateTime validTo; // Ngày hết hạn
    private boolean isActive; // Trạng thái hoạt động (TRUE/FALSE)

    public Voucher() {
    }

    public Voucher(String code, String description, String type, double discountValue,
                   double minimumOrderAmount, int usageLimit, LocalDateTime validFrom,
                   LocalDateTime validTo, boolean isActive) {
        this.code = code;
        this.description = description;
        this.type = type;
        this.discountValue = discountValue;
        this.minimumOrderAmount = minimumOrderAmount;
        this.usageLimit = usageLimit;
        this.validFrom = validFrom;
        this.validTo = validTo;
        this.isActive = isActive;
        this.usedCount = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(double discountValue) {
        this.discountValue = discountValue;
    }

    public double getMinimumOrderAmount() {
        return minimumOrderAmount;
    }

    public void setMinimumOrderAmount(double minimumOrderAmount) {
        this.minimumOrderAmount = minimumOrderAmount;
    }

    public int getUsageLimit() {
        return usageLimit;
    }

    public void setUsageLimit(int usageLimit) {
        this.usageLimit = usageLimit;
    }

    public int getUsedCount() {
        return usedCount;
    }

    public void setUsedCount(int usedCount) {
        this.usedCount = usedCount;
    }

    public LocalDateTime getValidFrom() {
        return validFrom;
    }

    public void setValidFrom(LocalDateTime validFrom) {
        this.validFrom = validFrom;
    }

    public LocalDateTime getValidTo() {
        return validTo;
    }

    public void setValidTo(LocalDateTime validTo) {
        this.validTo = validTo;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}