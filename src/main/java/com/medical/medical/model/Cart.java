package com.medical.medical.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class Cart {
	
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
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
    public Cart(int orderId, int totalAmount, int quantity, String orderDate, int month, int year, Customer customer,
			Product product) {
		super();
		this.orderId = orderId;
		this.totalAmount = totalAmount;
		this.quantity = quantity;
		this.orderDate = orderDate;
		this.month = month;
		this.year = year;
		this.customer = customer;
		this.product = product;
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

	public int getOrderId() {
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
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	

}
