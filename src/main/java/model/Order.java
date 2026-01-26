package model;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class Order {
	private int id;
	private int usersId;
	private int vouchersId;
	private String orderCode;
	private Timestamp orderDate;
	private OrderStatus status;
	private PaymentStatus paymentStatus;
	private double totalProductsPrice;
	private double shippingFee;
	private double discountAmount;
	private double finalAmount;
	private String adminNote;
	private String recipientName;

	// Constructor
	public Order() {
	}

	public Order(int id, int usersId, int vouchersId, String orderCode, Timestamp orderDate, OrderStatus status,
                 PaymentStatus paymentStatus, double totalProductsPrice, double shippingFee, double discountAmount,
                 double finalAmount, String adminNote) {
		super();
		this.id = id;
		this.usersId = usersId;
		this.vouchersId = vouchersId;
		this.orderCode = orderCode;
		this.orderDate = orderDate;
		this.status = status;
		this.paymentStatus = paymentStatus;
		this.totalProductsPrice = totalProductsPrice;
		this.shippingFee = shippingFee;
		this.discountAmount = discountAmount;
		this.finalAmount = finalAmount;
		this.adminNote = adminNote;
	}

	public Order(int id, int usersId, int vouchersId, String orderCode, Timestamp orderDate, OrderStatus status,
                 PaymentStatus paymentStatus, double totalProductsPrice, double shippingFee, double discountAmount,
                 double finalAmount) {
		this.id = id;
		this.usersId = usersId;
		this.vouchersId = vouchersId;
		this.orderCode = orderCode;
		this.orderDate = orderDate;
		this.status = status;
		this.paymentStatus = paymentStatus;
		this.totalProductsPrice = totalProductsPrice;
		this.shippingFee = shippingFee;
		this.discountAmount = discountAmount;
		this.finalAmount = finalAmount;
	}

//Getters & Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getUsersId() {
		return usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public Integer getVouchersId() {
		return vouchersId;
	}

	public void setVouchersId(Integer vouchersId) {
		this.vouchersId = vouchersId;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public Timestamp getOrderDate() {

		return orderDate;
	}

	public String getFmOrderDate() {
		if (this.orderDate == null)
			return "";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy ");
		return this.orderDate.toLocalDateTime().format(formatter);
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public double getTotalProductsPrice() {
		return totalProductsPrice;
	}

	public void setTotalProductsPrice(double totalProductsPrice) {
		this.totalProductsPrice = totalProductsPrice;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}

	public double getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(double discountAmount) {
		this.discountAmount = discountAmount;
	}

	public double getFinalAmount() {
		return finalAmount;
	}

	public void setFinalAmount(double finalAmount) {
		this.finalAmount = finalAmount;
	}

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getAdminNote() {
		if (adminNote == null || adminNote.trim() == "")
			return "Không có note";
		return adminNote;
	}

	public void setAdminNote(String adminNote) {
		this.adminNote = adminNote;
	}

	public void setUsersId(int usersId) {
		this.usersId = usersId;
	}

	public void setVouchersId(int vouchersId) {
		this.vouchersId = vouchersId;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

}
