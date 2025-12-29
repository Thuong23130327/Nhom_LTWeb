package model;

import java.sql.Timestamp;

public class ContactReply {
    private int id;
    private int contactId;
    private String senderType; // "User" hoặc "Admin"
    private String message;
    private Timestamp createdAt;
    
    public ContactReply() {
		// TODO Auto-generated constructor stub
	}
	public ContactReply(int id, int contactId, String senderType, String message, Timestamp createdAt) {
		super();
		this.id = id;
		this.contactId = contactId;
		this.senderType = senderType;
		this.message = message;
		this.createdAt = createdAt;
	}
	public ContactReply(int contactId, String senderType, String message) {
		super();
		this.contactId = contactId;
		this.senderType = senderType;
		this.message = message;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}
	public String getSenderType() {
		return senderType;
	}
	public void setSenderType(String senderType) {
		this.senderType = senderType;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
	
    
    


}
