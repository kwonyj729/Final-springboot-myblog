package com.cos.blog.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.blog.model.product.Product;
import com.cos.blog.service.ProductService;


@Controller
public class ProductController {

	@Autowired 
	private ProductService productService;

	@GetMapping("/post/product")	
	public String productHome(Model model) {
		System.out.println("컨트롤러 도착");
		
		model.addAttribute("products", productService.상품보기());
		return "/post/productList";
		
	}
	
	@GetMapping("/product/total")	
	public @ResponseBody List<Product> productList() {
		List<Product> products=productService.전체상품보기();
		return products;
	}
	
	@GetMapping("/product/{type}")
	public @ResponseBody List<Product> productType(@PathVariable String type) {
		List<Product> products=productService.타입별보기(type);
		return products;
	}
	
	@GetMapping("/product/price/{type}")
	public @ResponseBody List<Product> productPrice(@PathVariable String type) {
		List<Product> products=productService.가격순타입별보기(type);
		return products;
	}
	
	@GetMapping("/product/price")
	public @ResponseBody List<Product> productPriceTotal() {
		List<Product> products=productService.가격순보기();
		return products;
	}
	
	@GetMapping("/product/orderCount/{type}")
	public @ResponseBody List<Product> productOrder(@PathVariable String type) {
		List<Product> products=productService.인기순타입별보기(type);
		return products;
	}
	
	@GetMapping("/product/orderCount")
	public @ResponseBody List<Product> productOrder() {
		List<Product> products=productService.인기순보기();
		return products;
	}
	


}
