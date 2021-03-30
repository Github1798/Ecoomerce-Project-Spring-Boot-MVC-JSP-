package com.app.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pojos.Category;
import com.app.service.ICategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private ICategoryService cateService;
	
	public CategoryController() {
		// TODO Auto-generated constructor stub
	System.out.println("in category controller");
	}
	
	@GetMapping("/category")
	public String inCategoryForm() {
		return "/admin";
	}
	@GetMapping("/{cId}")
	public Category getCatById(int cId) {
		return cateService.getCatById(cId);
	}

	
	@GetMapping
	public List<Category> showAllCategory()
	{
		return cateService.showAllCategory();
	}
	
	 
	@PostMapping
	public String addCategory( Category category,HttpSession session,Model map)
	{
	    System.out.println("in add category"+category);
	    
	    try {
	    	cateService.addCategory(category);
	    	session.setAttribute("message"," Category added successfully with the id ,"+category.getCategoryId());
	    	//session.setAttribute("current_user", category);
	    	return "redirect:/admin";
	    }
	    catch(RuntimeException e)
	    {
	    	map.addAttribute("message","Some error occured ..please try again");
			return "/admin";	    
	   
	}
	
}
}
