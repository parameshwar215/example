package com.medical.medical.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.medical.medical.model.Customer;
@Repository
public interface ICustomerRepo extends  JpaRepository<Customer, Integer> {
    @Query("From Customer where email=?1 and password=?2")
	Customer findByEmailPassword(String email, String password);

}
