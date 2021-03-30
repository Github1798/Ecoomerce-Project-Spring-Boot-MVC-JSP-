package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pojos.User;
import com.app.service.IUserService;

@Controller
@RequestMapping("/user")
public class RegisterController {
	
	@Autowired
	private IUserService userService;
	
	public RegisterController() {
		System.out.println("in register...constructor");
	}
	
	//@GetMapping("/register")
	@GetMapping(path="/register")
	public String showRegPage() {
		return "/register";
	}
	
	@PostMapping("/register")
	public String registerio(@RequestParam String name,@RequestParam String email,@RequestParam String password,@RequestParam String phoneNo,@RequestParam String Address )
	{
		try {
			User user = new User(name,email,password,phoneNo,Address);
			System.out.println(user);
			userService.registerUser(user);

			return "/login";
		} catch (Exception e) {
			return "/register";
		}
	}
	

}
