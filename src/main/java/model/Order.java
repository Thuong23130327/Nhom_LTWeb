package model;

import java.sql.Date;
import java.time.LocalDateTime;

public class Order {
    private int id;
    private Integer usersId;
    private Integer vouchersId;
    private String orderCode;
    private LocalDateTime orderDate;
    private String status;
    private PaymentStatus paymentStatus;
    private double totalProductsPrice;
    private double shippingFee;
    private double discountAmount;
    private double finalAmount;

//Constructor
    public Order() {
    }

    public Order(int id, Integer usersId, Integer vouchersId, String orderCode, LocalDateTime orderDate, String status, PaymentStatus paymentStatus, double totalProductsPrice, double shippingFee, double discountAmount, double finalAmount) {
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

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public PaymentStatus getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(PaymentStatus paymentStatus) {
        this.paymentStatus = paymentStatus;
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
}
