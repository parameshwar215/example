package com.medical.medical.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.medical.medical.model.Orders;

@Repository
public interface IOredersRepo extends JpaRepository<Orders, Integer> {

}
