package com.medical.medical.model.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.medical.medical.model.Product;
import com.medical.medical.repo.IProductRepo;
import com.medical.medical.services.ProductServices;


@Controller
public class ProductController {
	@Autowired
	ProductServices productServices;
	@Autowired
	IProductRepo productRepo;
	
	@PostMapping("/addProduct")
	public String  AddPruduct(Product product) {
		productServices.addProduct(product);
		return "redirect:/viewProducts";
		
		
		
	}
	@GetMapping("/viewProducts")
	public ModelAndView home() {
		List<Product> list=productRepo.listOfProduct();
		ModelAndView m= new ModelAndView("allProducts");
		m.addObject("list", list);
		return m;
	}
	@GetMapping("/manageProducts")
	public ModelAndView manageProducts() {
		List<Product> list=productRepo.listOfProduct();
		ModelAndView m= new ModelAndView("productManage");
		m.addObject("list", list);
		return m;
	}
	
	@GetMapping("/deleteProduct/{id}")
	public String deleteProduct(@PathVariable int id) {
		productServices.deleteProduct(id);
		return "redirect:/manageProducts";
		
	}
	@GetMapping("/getProduct/{id}")
	public ModelAndView getProduct(@PathVariable int id) {
		
		Product product=productServices.findProduct(id);
		ModelAndView m= new ModelAndView("updateProduct");
		m.addObject("product", product);
		return m;
		
	}
	@PostMapping("/updateProduct/{id}")
	public String updateProduct(Product newProduct ,@PathVariable int id) {
	
		Product oldProduct=productServices.findProduct(id);
		oldProduct.setProductName(newProduct.getProductName());
		oldProduct.setCategory(newProduct.getCategory());
		oldProduct.setPrice(newProduct.getPrice());
		oldProduct.setRackNo(newProduct.getRackNo());
		oldProduct.setShellNo(newProduct.getShellNo());
		oldProduct.setStock(newProduct.getStock());
		productServices.addProduct(oldProduct);
		return "redirect:/manageProducts";
		
		
		
	}
	
	@GetMapping("/searchProduct")
	public ModelAndView  getProducts(@RequestParam("value") String name) {
		List<Product> list=productServices.findAllProducts();
		
		ModelAndView m= new ModelAndView("searchProduct");
		
		for(Product p:list) {
			if(p.getProductName().equalsIgnoreCase(name)) {
				
				m.addObject("product", p);
				return m;
				
			}
		}
		return m;
			
		
		
	}
	@GetMapping("/searchProduct1")
	public ModelAndView  getProducts1(@RequestParam("value") String name) {
		List<Product> list=productServices.findAllProducts();
		ModelAndView m= new ModelAndView("searchProduct1");
		m.addObject("list", list);
		for(Product p:list) {
			if(p.getProductName().equalsIgnoreCase(name)) {
				
				m.addObject("product", p);
				return m;
				
			}
		}
		return m;
			
		
		
	}
	

}











