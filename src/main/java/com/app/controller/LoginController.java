package com.app.controller;

import java.util.List;

import com.app.service.ICategoryService;
import com.app.service.IProductService;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pojos.Category;
import com.app.pojos.Product;
import com.app.pojos.User;
//import com.app.service.IProductService;
import com.app.service.IUserService;

@Controller
@RequestMapping("/user")
public class LoginController {

	@Autowired
	private IUserService userService;
	@Autowired
	private IProductService prodService;
	@Autowired
	private ICategoryService cateService;
	
	public LoginController() {
		// TODO Auto-generated constructor stub
		System.out.println("in logincontroller");
	}

    @GetMapping("/login")  
    public String showLoginForm() {
    	System.out.println("in login form");
    	return "/login";
    }
    
    @PostMapping("/login")
    public String processLoginForm(@RequestParam String email,@RequestParam String password,Model map,
    		HttpSession session) {
    	System.out.println("Request parameters are......");
		System.out.println("Emailid :" + email);
		System.out.println("Password :" + password);
		
		try {
			User validatedUser=userService.authenticateUser(email, password);
			System.out.println("Login Sucessfull");
			List<Category> categoryList=cateService.showAllCategory();
			List<Product> productList=prodService.showAllProducts();
			map.addAttribute("message","Welcome,"+validatedUser.getUserName());
			System.out.println(validatedUser);
			session.setAttribute("current_list", categoryList);
			//session.setAttribute("product_list", productList);
			System.out.println("in login controller"+prodService.showAllProducts());
			System.out.println("in login controller..categoryList"+categoryList);
			session.setAttribute("current-user", validatedUser);
			if(validatedUser.getUserType().equals("admin")) {
			    return "/admin";
			}else{	
				return "/normal";
			}
			}catch(RuntimeException e) {
				map.addAttribute("message","Invalid login,please Retry");
				return "/login";
			}
    }
}
