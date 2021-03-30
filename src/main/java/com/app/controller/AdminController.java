package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	public AdminController()
	{
	  System.out.println("in const of ..admin and normal controller");
	}
	
	@GetMapping
	public String showAdminUser()
	{
		System.out.println("in admin");
		return "/admin";
		
	}
	
	@RequestMapping("/normal")
	public String showNoramlUser()
	{
		return "/normal";
		
	}
	
	
}

