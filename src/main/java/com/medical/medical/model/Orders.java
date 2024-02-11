package com.medical.medical.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Orders {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int orderId;
	private int totalAmount;
	private int quantity;
	private String orderDate;
	private int month;
	private int year;
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@OneToMany(mappedBy = "products", cascade = CascadeType.ALL)
	private List<OrderItems> products;
	public Orders() {
		super(); 
		// TODO Auto-generated constructor stub
	}
	
	













	public Orders(int orderId, int totalAmount, int quantity, String orderDate, int month, int year, Customer customer,
			List<OrderItems> products) {
		super();
		this.orderId = orderId;
		this.totalAmount = totalAmount;
		this.quantity = quantity;
		this.orderDate = orderDate;
		this.month = month;
		this.year = year;
		this.customer = customer;
		this.products = products;
	}















	public List<OrderItems> getProducts() {
		return products;
	}















	public void setProducts(List<OrderItems> products) {
		this.products = products;
	}















	public int getMonth() {
		return month;
	}



	public void setMonth(int i) {
		this.month = i;
	}



	public int getYear() {
		return year;
	}



	public void setYear(int i) {
		this.year = i;
	}



	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String string) {
		this.orderDate = string;
	}

	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}







	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", totalAmount=" + totalAmount + ", quantity=" + quantity + ", orderDate="
				+ orderDate + ", month=" + month + ", year=" + year + ", customer=" + customer + ", products="
				+ products + "]";
	}















	
	
	
	

}
