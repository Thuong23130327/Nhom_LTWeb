package model;

public class Image {
	int id;
	int productId;
	String imageUrl;
	int sortOrder;

	public Image(int id, int productId, String imageUrl, int sortOrder) {
		super();
		this.id = id;
		this.productId = productId;
		this.imageUrl = imageUrl;
		this.sortOrder = sortOrder;
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

}
