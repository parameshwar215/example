package com.medical.medical.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String productName;
	private  int price;
	private String category;
	private int rackNo;
	private int shellNo;
	private int stock;
	private String expireDate;
	
	@ManyToOne
	Orders products;
	
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int id, String productName, int price, String category, int rackNo, int shellNo, int stock,String expireDate) {
		super();
		this.id = id;
		this.productName = productName;
		this.price = price;
		this.category = category;
		this.rackNo = rackNo;
		this.shellNo = shellNo;
		this.stock = stock;
		this.expireDate=expireDate;
	}
	
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getRackNo() {
		return rackNo;
	}
	public void setRackNo(int rackNo) {
		this.rackNo = rackNo;
	}
	public int getShellNo() {
		return shellNo;
	}
	public void setShellNo(int shellNo) {
		this.shellNo = shellNo;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", price=" + price + ", category=" + category
				+ ", rackNo=" + rackNo + ", shellNo=" + shellNo + ", stock=" + stock + "]";
	}
	
	
	
	

}
