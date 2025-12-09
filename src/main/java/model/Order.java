package model;

import java.sql.Date;

public class Order {
    private int id;
    private int userId;
    private Date date;
    private double totalMoney;

//Constructor
    public Order() {
    }

    public Order(int id, int userId, Date date, double totalMoney) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.totalMoney = totalMoney;
    }

 //Getters & Setters
    public int getId() {
         return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
}
