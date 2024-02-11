package com.medical.medical.model;

import java.util.Set;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Customer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int Id;
	private String name;
	
	private String gender;
	private String age;
	private String dateOfBirth;
	private String email;
	private String password;
	@OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
	private Set<Orders> orders;
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(int id, String name, String gender, String age, String dateOfBirth, String email, String password,
			Set<Orders> orders) {
		super();
		Id = id;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.dateOfBirth = dateOfBirth;
		this.email = email;
		this.password = password;
		this.orders = orders;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
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
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
		return "Customer [Id=" + Id + ", name=" + name + ", gender=" + gender + ", age=" + age + ", dateOfBirth="
				+ dateOfBirth + ", email=" + email + ", password=" + password + "]";
	}
	
	
	

	
	

}
