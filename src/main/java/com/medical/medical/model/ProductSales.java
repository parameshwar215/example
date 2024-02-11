package com.medical.medical.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class ProductSales {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private int quantity;
	private int month;
	private int year;
	private float avg;
	private int productId;
	public ProductSales() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductSales(int id, int quantity, int month, int year, float avg, int productId) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.month = month;
		this.year = year;
		this.avg = avg;
		this.productId = productId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "ProductSales [id=" + id + ", quantity=" + quantity + ", month=" + month + ", year=" + year + ", avg="
				+ avg + ", productId=" + productId + "]";
	}
	

}
