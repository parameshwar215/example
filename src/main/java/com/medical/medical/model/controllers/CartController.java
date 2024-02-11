package com.medical.medical.model.controllers;

import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.medical.medical.model.Cart;
import com.medical.medical.model.Customer;
import com.medical.medical.model.Orders;
import com.medical.medical.model.Product;
import com.medical.medical.repo.ICartRepo;
import com.medical.medical.repo.ICustomerRepo;
import com.medical.medical.repo.IProductRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	ICartRepo cartRepo;
	
	@Autowired
	ICustomerRepo customerRepo;
	
	
	@Autowired
	IProductRepo productService;
	
	@GetMapping("/cart")
	public ModelAndView  getProducts1(HttpSession session) {
		int total=0;
		List<Cart> list=cartRepo.findAll();
		ArrayList<Cart> l1=new ArrayList<>();
		for(Cart item:list) {
			if(item.getCustomer().getEmail().equals((String)session.getAttribute("custEmail"))) {
				l1.add(item);
				total+=item.getTotalAmount();
			}
			
		};
		
		ModelAndView m= new ModelAndView("cart");
		m.addObject("list", l1);
		m.addObject("total", total);
		return m;
		
	}
	@GetMapping("/addToCart/{pid}")
	public String  order(@PathVariable int pid,@RequestParam("quantity") int quantity,HttpSession session ) {
		YearMonth currentYearMonth = YearMonth.now();
		Customer customer=customerRepo.getById((int)session.getAttribute("cid"));
		Product p=productService.getById(pid);
		Cart c=new Cart();
		int total=p.getPrice()*quantity;
		c.setQuantity(quantity);
		c.setCustomer(customer);
		c.setProduct(p);
		c.setTotalAmount(total);
		cartRepo.save(c);
		return "redirect:/home";

	}
	
	@GetMapping("/removeProductFromCart/{id}")
	public String removeProduct(@PathVariable int id) {
		cartRepo.deleteById(id);
		return "redirect:/cart";
		
	}
	

}
