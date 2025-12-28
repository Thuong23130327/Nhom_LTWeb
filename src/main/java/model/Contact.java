package model;

import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;

public class Contact {
	private int id;
	private Integer usersID;
	private String senderName;
	private String senderMail;
	private String phone;
	private String mess;
	private Status status;
	private Timestamp createdAt;

	private static final int WARNING_LIMIT = 60000;

	public Contact() {
		// TODO Auto-generated constructor stub
	}

	public Contact(Integer usersID, String senderName, String senderMail, String phone, String mess) {
		super();
		this.usersID = usersID;
		this.senderName = senderName;
		this.senderMail = senderMail;
		this.phone = phone;
		this.mess = mess;
		this.status = Status.New;
	}

	public Contact(int id, Integer usersID, String senderName, String senderMail, String phone, String mess,
			Status status, Timestamp createdAt) {
		super();
		this.id = id;
		this.usersID = usersID;
		this.senderName = senderName;
		this.senderMail = senderMail;
		this.phone = phone;
		this.mess = mess;
		this.status = status;
		this.createdAt = createdAt;
	}

	public boolean nearFull() {
		if (this.mess == null)
			return false;
		return this.mess.getBytes(StandardCharsets.UTF_8).length >= WARNING_LIMIT;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
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

	public String getSenderMail() {
		return senderMail;
	}

	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public enum Status {
		New, Replied;
	}

}