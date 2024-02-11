package com.medical.medical.model.controllers;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.medical.medical.model.Product;
import com.medical.medical.model.ProductSales;
import com.medical.medical.repo.IProductRepo;
import com.medical.medical.repo.IProductSalesRepo;

@Controller
public class ProductSalesController {
	 @Autowired
	IProductSalesRepo productSalesRepo;
	 
	 @Autowired
	IProductRepo productRepo;
	 
	 
	
	@GetMapping("/report")
	public ModelAndView reports(){
		List<ProductSales> ps= productSalesRepo.findByYear1(2023);
		Collections.sort(ps, Comparator.comparingDouble(s -> (double) ((ProductSales) s).getAvg()).reversed());
	    
		List<Product>pl=productRepo.findAll();
		ModelAndView m= new ModelAndView("reports");
		m.addObject("year",2023);
		m.addObject("salesList", ps);
		m.addObject("prList",pl);
		return m;
		
	}
	
	@GetMapping("/yearlyReport")
	public ModelAndView yearlyReports(@RequestParam("year") int year){
		List<ProductSales> ps= productSalesRepo.findByYear(year);
		Collections.sort(ps, Comparator.comparingDouble(ProductSales::getAvg).reversed());

		List<Product>pl=productRepo.findAll();
		ModelAndView m= new ModelAndView("reports");
		m.addObject("year",year);
		m.addObject("salesList", ps);
		m.addObject("prList",pl);
		return m;
		
	}

}
