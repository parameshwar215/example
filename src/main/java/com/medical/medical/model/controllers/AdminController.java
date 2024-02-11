package com.medical.medical.model.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medical.medical.model.Admin;
import com.medical.medical.model.Customer;
import com.medical.medical.services.AdminServices;
import com.medical.medical.services.CustomerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	AdminServices adminService;
	@Autowired
	CustomerService customerService;
	
	
	@RequestMapping("/")
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping("/addProduct")
	public String addProduct() {
		return "addproduct";
	}

	@RequestMapping("/home")
	public String home() {
		return "clientHome";
	}
	@PostMapping("/adminLogin")
	public String adminLogin(@RequestParam("email") String email,@RequestParam("password") String password ,@RequestParam("role") String role,HttpSession session,ModelMap modelMap,Model model)	
	{
		if(role.endsWith("Admin")) {
		System.out.println(email+"And"+ password);
		Admin ad=adminService.findByEmailPassword(email, password);
		System.out.print(ad);
		
		if(ad!=null) {
			session.setAttribute("aid",ad.getId());
			session.setAttribute("aemail",ad.getEmail());
			session.setAttribute("adminEmail",ad.getEmail());
			session.setAttribute("aname",ad.getName());
			
			
			return "redirect:/home";
			
		}
		else {
			return "redirect:/";
		}
		}else {
			System.out.println(email+"And"+ password);
			Customer c=customerService.findByEmailPassword(email, password);
			//System.out.print(cl);
			
			if(c!=null) {
				session.setAttribute("cid",c.getId());
				session.setAttribute("aemail",c.getEmail());
				session.setAttribute("custEmail",c.getEmail());
				session.setAttribute("aname",c.getName());
				
				
				return "redirect:/home";
				
			}
			else {
				return "redirect:/";
			}
			
		}
		
	}
	@GetMapping("/adminLogout")
	public String AdminLogout(HttpSession session)
	{
		session.removeAttribute("aid");
		session.setAttribute("adminEmail",null);
		session.setAttribute("custEmail",null);
		session.setAttribute("aemail",null);
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/sessionexpired")
	public String sessionExpired()
	{
		
		return "sessionExpired";
	}
	

}
