package com.medical.medical.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.medical.model.Customer;
import com.medical.medical.repo.ICustomerRepo;

@Service
public class CustomerService {
	@Autowired
	ICustomerRepo customerRepo;
	
	public Customer saveCustomer(Customer c) {
		return customerRepo.save(c);
	}

	public Customer findByEmailPassword(String email, String password) {
		
		return customerRepo.findByEmailPassword(email,password);
	}

}
