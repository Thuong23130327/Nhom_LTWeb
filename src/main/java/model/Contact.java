package model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Contact {
	private int id;
	private Integer usersID;
	private String senderMail;
	private String senderName;
	private String phone;
	private String mess;
	private String replyMess;
	private Status status;
	private Timestamp createdAt;

	public Contact() {
	}

	public Contact(int id, Integer usersID, String senderMail, String senderName, String phone, String mess,
			Status status, Timestamp createdAt) {
		super();
		this.id = id;
		this.usersID = usersID;
		this.senderMail = senderMail;
		this.senderName = senderName;
		this.phone = phone;
		this.mess = mess;
		this.status = status;
		this.createdAt = createdAt;
	}

	public Contact(Integer userId, String email, String name, String phone, String message) {
		this.usersID = userId;
		this.senderMail = email;
		this.senderName = name;
		this.phone = phone;
		this.mess = message;
        this.status =Status.New;
        this.replyMess = "";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getUsersID() {
		return usersID;
	}

	public void setUsersID(Integer usersID) {
		this.usersID = usersID;
	}

	public String getSenderMail() {
		return senderMail;
	}

	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
	}

	public Status getStatus() {
		return status;
	}

	public String getStringStatus() {
		return status.toString();
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public String getStringCreatedAt() {
		if (createdAt == null)
			return "Chưa xác định";
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		return sdf.format(createdAt);

	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getReplyMess() {
		return replyMess;
	}

	public void setReplyMess(String replyMess) {
		this.replyMess = replyMess;
	}

	public void markNew() {
		this.status = Status.New;
	}

	public void read() {
		this.status = Status.Read;
	}

	public void replied() {
		this.status = Status.Replied;
	}

	public enum Status {
		New, Read, Replied;
	}

}