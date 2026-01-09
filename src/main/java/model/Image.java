package model;

public class Image {
	private int id, productId;
	private String imgUrl;
	private int sortOrder;

	public Image(int id, int productId, String imgUrl, int sortOrder) {
		super();
		this.id = id;
		this.productId = productId;
		this.imgUrl = imgUrl;
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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

}
