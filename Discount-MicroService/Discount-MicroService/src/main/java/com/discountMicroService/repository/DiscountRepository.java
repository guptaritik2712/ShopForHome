package com.discountMicroService.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.discountMicroService.entity.Discount;


public interface DiscountRepository extends JpaRepository<Discount, String> {

	void deleteById(Long code);

	List<Discount> findByEmail(String email);
}
