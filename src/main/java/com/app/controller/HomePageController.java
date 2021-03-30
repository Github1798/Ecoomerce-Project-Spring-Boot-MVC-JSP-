package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pojos.Category;
import com.app.pojos.Product;
import com.app.service.ICategoryService;
import com.app.service.IProductService;

@Controller

public class HomePageController {

	@Autowired
	private IProductService prodService;
	@Autowired
	private ICategoryService cateService;

	public HomePageController() {
		System.out.println("in const of ..homecontr");
	}
	
	
	@GetMapping("/cat")
	public String getProductByCatId(@RequestParam Integer cid,HttpSession session)
	{
		
		System.out.println("in method");
	    List<Product> pCateList=prodService.getAllProductsByCatId(cid);
		session.setAttribute("pCategory_list",pCateList );
		System.out.println("in home controller"+pCateList);
		return "/categorylist";
		
	}

	@RequestMapping("/")
	public String hellio(HttpSession session, Category category) {

		

		List<Category> categoryList = cateService.showAllCategory();
		List<Product> productList = prodService.showAllProducts();
    	session.setAttribute("message"," Category added successfully with the id ,"+category.getCategoryId());
        session.setAttribute("category_list", categoryList);
		session.setAttribute("product_list", productList);
		// System.out.println("in homepage"+prodService.showAllProducts());
		return "/index";

	}
	
	@RequestMapping("/checkOut")
    public String cart() {
		return "/checkOut";
	}
	
	@RequestMapping("/payMent")
    public String payMent() {
		return "/payMent";
	}
	
	@RequestMapping("/end")
    public String end() {
		return "/end";
	}
	
	
}
