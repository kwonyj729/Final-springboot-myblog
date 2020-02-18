package com.cos.blog.repository;

import java.util.List;

import com.cos.blog.model.product.Product;



public interface ProductRepository {
	
	List<Product> findAll();
	
	List<Product> findType(String type);
	
	List<Product> findPriceType(String type);
	List<Product> findPriceTotal();
	
	List<Product> findOrderType(String type);
	List<Product> findOrderTotal();


	
	
	
	
}
