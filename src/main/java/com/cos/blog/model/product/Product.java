package com.cos.blog.model.product;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class Product {
	private int id;
	private String pname;
	private int price;
	private int orderCount;
	private String type;
	
	@Builder
	public Product(int id, String pname, int price, int orderCount, String type) {
		
		this.id = id;
		this.pname = pname;
		this.price = price;
		this.orderCount = orderCount;
		this.type = type;
	}
	
	
}
