package com.medical.medical.model.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medical.medical.model.Customer;
import com.medical.medical.services.CustomerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/register")
	public String registerPage() {
		return "clientRegistration";
	}
	
	@PostMapping("/saveClient")
	public String saveClient(Customer c) {
		customerService.saveCustomer(c);
		return "loginPage";
	}
	

}
