package com.cos.blog.model.mount;

import lombok.Builder;
import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Mountain {
	private int id;
	private String mName;
	private int height;
	private int regionId;
	
	@Builder
	public Mountain(int id, String mName, int height, int regionId) {
	
		this.id = id;
		this.mName = mName;
		this.height = height;
		this.regionId = regionId;
	}
}

