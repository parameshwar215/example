package com.medical.medical.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.medical.medical.model.Cart;

@Repository
public interface ICartRepo extends JpaRepository<Cart ,Integer>{

	
}
