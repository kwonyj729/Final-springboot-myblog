package com.cos.blog.model.mount;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class Regions {
	private int id;
	private String regName;
	private String city;
	
	
	@Builder
	public Regions(int id, String regName, String city) {
		
		this.id = id;
		this.regName = regName;
		this.city = city;
	}
}

