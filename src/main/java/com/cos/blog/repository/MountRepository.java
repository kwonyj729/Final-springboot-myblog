package com.cos.blog.repository;

import java.util.List;

import com.cos.blog.model.mount.Mountain;
import com.cos.blog.model.mount.Regions;

public interface MountRepository {
	
	List<Regions> findAllRegions();
	List<Mountain> findAllMountain(int regionId);
	Mountain findById(int mountId);
}
