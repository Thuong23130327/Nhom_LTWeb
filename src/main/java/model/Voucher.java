package model;

import java.time.LocalDateTime;

public class Voucher {

	// Thuộc tính
	private int id;
	private String code; // Mã Vou để app
	private String description; // Mô tả
	private double discountValue; // % giảm
	private double minimumOrderAmount; // giá trị tối thiểu
	private int usageLimit; // Số lần Voucher đc dùng
	private int usedCount; // Số lần Voucher đã được dùng
	private LocalDateTime validFrom; // Ngày bắt đầu hiệu lực
	private LocalDateTime validTo; // Ngày hết hạn

	public Voucher() {
	}

	public Voucher(String code, String description, double discountValue, double minimumOrderAmount, int usageLimit,
			int usedCount, LocalDateTime validFrom, LocalDateTime validTo) {
		super();
		this.code = code;
		this.description = description;
		this.discountValue = discountValue;
		this.minimumOrderAmount = minimumOrderAmount;
		this.usageLimit = usageLimit;
		this.usedCount = usedCount;
		this.validFrom = validFrom;
		this.validTo = validTo;
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

}