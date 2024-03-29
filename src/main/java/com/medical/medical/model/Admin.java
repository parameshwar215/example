package com.medical.medical.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Admin {
	@Id
	private int id;
	private String email;
	private String password;
	
	private String name;
	
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(int id, String email, String password ,String name) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name=name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
