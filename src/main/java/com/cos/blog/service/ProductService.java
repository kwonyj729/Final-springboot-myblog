package com.cos.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.cos.blog.model.product.Product;

import com.cos.blog.repository.ProductRepository;

@Service
public class ProductService {
	
	
	
	@Autowired
	private ProductRepository productRepository;
	
	
	public List<Product> 상품보기(){
		return productRepository.findAll();
	}
	
	public List<Product> 전체상품보기(){
		return productRepository.findAll();
	}
	
	public List<Product> 타입별보기(String type){
		return productRepository.findType(type);
	}
	
	public List<Product> 가격순타입별보기(String type){
		return productRepository.findPriceType(type);
	}
	
	public List<Product> 가격순보기(){
		return productRepository.findPriceTotal();
	}
	
	public List<Product> 인기순타입별보기(String type){
		return productRepository.findOrderType(type);
	}
	
	public List<Product> 인기순보기(){
		return productRepository.findOrderTotal();
	}
}