package com.medical.medical.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.medical.medical.model.ProductSales;

@Repository
public interface IProductSalesRepo extends JpaRepository<ProductSales, Integer> {
    @Query("From ProductSales where productId=?1")
	ProductSales getByProductId();
    @Query("From ProductSales where productId=?1 and month=?2 and year=?3")
	ProductSales getByProductIdMonthYear(int id,int month,int year);
    
    @Query("From ProductSales where year=?1")
	List<ProductSales> findByYear(int year);
    @Query("From ProductSales where year=?1")
	List<ProductSales> findByYear1(int year);

}
