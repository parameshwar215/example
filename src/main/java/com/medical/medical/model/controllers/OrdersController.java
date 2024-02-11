package com.medical.medical.model.controllers;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.medical.medical.model.Cart;
import com.medical.medical.model.Customer;
import com.medical.medical.model.OrderIdGenerator;
import com.medical.medical.model.OrderItems;
import com.medical.medical.model.Orders;
import com.medical.medical.model.Product;
import com.medical.medical.repo.ICartRepo;
import com.medical.medical.repo.ICustomerRepo;
import com.medical.medical.repo.IOrderRepo;
import com.medical.medical.repo.IOredersRepo;
import com.medical.medical.repo.IProductRepo;
import com.medical.medical.repo.IProductSalesRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrdersController {
	
	
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	@Autowired
	IOredersRepo oredersRepo ;
	
	@Autowired
	ICustomerRepo customerRepo;
	
	@Autowired
	IProductRepo productService;
	
	@Autowired
	IProductSalesRepo productSalesRepo;
	
	@Autowired 
	ICartRepo cartRepo;
	 @Autowired
	OrderIdGenerator orderIdGenerator;
	  @Autowired
	 IOrderRepo orderRepo;
	
	@GetMapping("/order/{pid}")
	public ModelAndView order(@PathVariable int pid,@RequestParam("quantity") int quantity) {
		
		
		Product p=productService.getById(pid);
		ModelAndView m= new ModelAndView("orderPage");
		int total=p.getPrice()*quantity;
		m.addObject("p", p);
		m.addObject("total",total);
		m.addObject("quantity",quantity);
		return m;

	}
	
	@RequestMapping("/conformOrder")
	public String conformOreder(HttpSession session) {
		
		int total=0;
		Orders orders=new Orders();
		String orderId=orderIdGenerator.generateOrderId();		
		Customer customer=customerRepo.getById((int)session.getAttribute("cid"));
		orders.setCustomer(customer);
		LocalDateTime currentDateTime = LocalDateTime.now();
		orders.setOrderDate( currentDateTime.format(FORMATTER));
		orders.setMonth(LocalDate.now().getMonthValue());
		orders.setYear(LocalDate.now().getYear());
		int quantity=0;
		Orders order=oredersRepo.save(orders);
		List<Cart> list=cartRepo.findAll();
		for (Cart item : list) {
			OrderItems order1=new OrderItems();
		    if (item.getCustomer().getEmail().equals((String) session.getAttribute("custEmail"))) {
		    	order1.setProducts(order);
		    	order1.setOrderDate(currentDateTime.format(FORMATTER));
		    	order1.setProductId(item.getProduct().getId());
		    	order1.setProductName(item.getProduct().getProductName());
		    	order1.setQuantity(item.getQuantity());
		    	order1.setOneOrderAmount(item.getTotalAmount());
		        total += item.getTotalAmount();
		        orderRepo.save(order1);
		        quantity++;
		    }
		}
		order.setTotalAmount(total);
		order.setQuantity(quantity);
		oredersRepo.save(order);
		
	
		
       
   return "redirect:/ordersList";
	
	}
	
	@RequestMapping("/ordersList")
	public ModelAndView  getProducts1(HttpSession session) {
		List<Orders> list=oredersRepo.findAll();
		ArrayList<Orders> l1=new ArrayList<>();
		for(Orders order:list) {
			if(order.getCustomer().getEmail().equals((String)session.getAttribute("custEmail"))) {
				l1.add(order);
				
			}
			
		};
		
		ModelAndView m= new ModelAndView("ordersList");
		m.addObject("list", l1);
		return m;
		
	}
	@GetMapping("/removeProduct/{id}")
	public String removeProduct(@PathVariable int id) {
		oredersRepo.deleteById(id);
		return "redirect:/ordersList";
		
	}

	
	

}
