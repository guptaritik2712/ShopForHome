package com.shopForHomeFirstMicroservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopForHomeFirstMicroservice.entity.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer>{

}
