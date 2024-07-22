package com.techlabs.model;

public class Student {

	private int id;
	private String lastName;
	private String firstName;
	private String emailid;
	public Student(int id, String firstName, String lastName, String emailid) {
		super();
		this.id = id;
		this.lastName = lastName;
		this.firstName = firstName;
		this.emailid = emailid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmail(String emailid) {
		this.emailid = emailid;
	}
	
}
