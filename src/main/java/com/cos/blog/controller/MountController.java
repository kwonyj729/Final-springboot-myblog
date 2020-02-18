package com.cos.blog.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cos.blog.model.mount.Mountain;
import com.cos.blog.service.MountService;

@Controller
public class MountController {

	@Autowired
	private MountService mountService;
	
	
	@GetMapping("/post/regionList")	
	public String regionList(Model model) {
		model.addAttribute("regions", mountService.지역목록보기());
		return "/post/mountList";
	}	

	@GetMapping("/post/mountList/{regionId}")	
	public @ResponseBody List<Mountain> mountList(@PathVariable int regionId) {
		List<Mountain> mountains = mountService.산목록보기(regionId);	
		return mountains;
	}
	
	@GetMapping("/post/mountain/{mountId}")
	public @ResponseBody Mountain mountDetail(@PathVariable int mountId) {		
		Mountain mountain = mountService.산상세보기(mountId);
		return mountain;
	}
}

