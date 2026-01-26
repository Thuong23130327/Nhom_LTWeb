package model;

public class OrderShipping {
	private int id;
	private int orderId;
	private String recipientName;
	private String phone;
	private String address;
	private String city;
	private String note;

	public OrderShipping() {
	}

	// Constructor tạo mới




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getNote() {
		if (note == null || note.trim() == "")
			return "Không có ghi chú";
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}