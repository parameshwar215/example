package com.medical.medical.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class OrderItems{
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	int Id;
	
	@ManyToOne
	@JoinColumn(name="order_id")
	private Orders products;
	
	private  int productId;
	private String productName;
	private int quantity;
	private String orderDate;
	private int oneOrderAmount;
	public OrderItems() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderItems(int id, Orders products, int productId, String productName, int quantity, String orderDate,
			int oneOrderAmount) {
		super();
		Id = id;
		this.products = products;
		this.productId = productId;
		this.productName = productName;
		this.quantity = quantity;
		this.orderDate = orderDate;
		this.oneOrderAmount = oneOrderAmount;
	}

	public int getOneOrderAmount() {
		return oneOrderAmount;
	}

	public void setOneOrderAmount(int oneOrderAmount) {
		this.oneOrderAmount = oneOrderAmount;
	}

	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Orders getProducts() {
		return products;
	}
	public void setProducts(Orders products) {
		this.products = products;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	
	

}