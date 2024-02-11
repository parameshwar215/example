package com.medical.medical.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.medical.model.Admin;
import com.medical.medical.repo.IAdminRepo;

@Service
public class AdminServices {

	 @Autowired
	 IAdminRepo adminRepo;
	public Admin findByEmailPassword(String email, String password) {
		return adminRepo.findByEmailPassword(email,password);
		
	}

}
