package com.medical.medical.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.medical.medical.model.Product;

@Repository
public interface IProductRepo extends JpaRepository<Product, Integer> {
	
	 @Query("FROM Product where productName=?1")
	  Product findByProductname(String name);
	 @Query("FROM Product entity ORDER BY entity.rackNo, entity.shellNo")
	 List<Product> listOfProduct();
	 
	
	

}
