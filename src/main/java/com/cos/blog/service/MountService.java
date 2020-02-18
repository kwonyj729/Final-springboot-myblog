package com.cos.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cos.blog.model.mount.Mountain;
import com.cos.blog.model.mount.Regions;
import com.cos.blog.repository.MountRepository;

@Service
public class MountService {
	
	@Autowired
	private MountRepository mountRepository;
	
	public List<Regions> 지역목록보기(){
		return mountRepository.findAllRegions();
	}
	
	public List<Mountain> 산목록보기(int regionId){
		return mountRepository.findAllMountain(regionId);
	}
	
	public Mountain 산상세보기(int mountId) {
		return mountRepository.findById(mountId);
	}
}
