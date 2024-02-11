package com.medical.medical.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.medical.model.Product;
import com.medical.medical.repo.IProductRepo;


@Service
public class ProductServices {
	
	@Autowired
	IProductRepo productRepo;
	
	public Product addProduct(Product product) {
		return productRepo.save(product);
		
	}

	public List<Product> findAllProducts() {
		
		return productRepo.findAll();
	}

	public void deleteProduct(int id) {
		productRepo.deleteById(id);
		
	}
	public Product findProduct(int id) {
		
		return productRepo.getById(id);
	}

	public Product findProductByName(String name) {
		
		return productRepo.findByProductname(name);
	}

}
