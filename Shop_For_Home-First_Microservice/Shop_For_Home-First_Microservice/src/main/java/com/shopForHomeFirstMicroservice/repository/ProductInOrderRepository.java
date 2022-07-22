package com.shopForHomeFirstMicroservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopForHomeFirstMicroservice.entity.ProductInOrder;

@Repository
public interface ProductInOrderRepository extends JpaRepository<ProductInOrder, Long>{

}
