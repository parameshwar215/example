package com.medical.medical.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.medical.medical.model.OrderItems;

@Repository
public interface IOrderRepo extends JpaRepository<OrderItems, Integer> {

}
