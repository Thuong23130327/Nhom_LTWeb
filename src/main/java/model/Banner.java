package model;

import java.sql.Timestamp;

public class Banner {
    private int id;
    private String imageUrl;
    private String targetUrl;
    private String title;
    private String description;
    private int sortOrder;
    private boolean isActive;
    private Timestamp createdAt;

    public Banner() {

    }


    public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Banner(int id, String imageUrl, String targetUrl, String title, String description, int sortOrder,
			boolean isActive, Timestamp createdAt) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.targetUrl = targetUrl;
		this.title = title;
		this.description = description;
		this.sortOrder = sortOrder;
		this.isActive = isActive;
		this.createdAt = createdAt;
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
