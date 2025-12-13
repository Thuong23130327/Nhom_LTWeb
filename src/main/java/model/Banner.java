package model;

public class Banner {
	private int id;
	private String imageUrl; // Đường dẫn tới tệp ảnh (ví dụ: /assets/slider/bose-qc45.jpg)
	private String targetUrl; // Liên kết đích khi click (ví dụ: /san-pham/bose-qc45)
	private int sortOrder; // Thứ tự hiển thị trên slider
	private boolean isActive;

	public Banner(String imageUrl, String targetUrl, int sortOrder, boolean isActive) {
		super();
		this.imageUrl = imageUrl;
		this.targetUrl = targetUrl;
		this.sortOrder = sortOrder;
		this.isActive = isActive;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getTargetUrl() {
		return targetUrl;
	}

	public void setTargetUrl(String targetUrl) {
		this.targetUrl = targetUrl;
	}

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
