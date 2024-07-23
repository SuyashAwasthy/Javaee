package com.techlabs.entity;

import java.sql.Timestamp;

public class Transaction {
	
	
	private int id;
    private int senderAccountNumber;
    private int receiverAccountNumber;
    private String type;
    private double amount;
    private Timestamp date;
    
    
	public Transaction(int id, int senderAccountNumber, int receiverAccountNumber, String type, double amount, Timestamp date) {
		super();
		this.id = id;
		this.senderAccountNumber = senderAccountNumber;
		this.receiverAccountNumber = receiverAccountNumber;
		this.type = type;
		this.amount = amount;
		this.date = date;
	}
	
	
	


	public Transaction(int senderAccountNumber, int receiverAccountNumber, String type, double amount) {
		super();
		this.senderAccountNumber = senderAccountNumber;
		this.receiverAccountNumber = receiverAccountNumber;
		this.type = type;
		this.amount = amount;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getSenderAccountNumber() {
		return senderAccountNumber;
	}


	public void setSenderAccountNumber(int senderAccountNumber) {
		this.senderAccountNumber = senderAccountNumber;
	}


	public int getReceiverAccountNumber() {
		return receiverAccountNumber;
	}


	public void setReceiverAccountNumber(int receiverAccountNumber) {
		this.receiverAccountNumber = receiverAccountNumber;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public double getAmount() {
		return amount;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}


	public Timestamp getDate() {
		return date;
	}


	public void setDate(Timestamp date) {
		this.date = date;
	}


	@Override
	public String toString() {
		return "Account [id=" + id + ", senderAccountNumber=" + senderAccountNumber + ", receiverAccountNumber="
				+ receiverAccountNumber + ", type=" + type + ", amount=" + amount + ", date=" + date + "]";
	}
    
	
	

}
