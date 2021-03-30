package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.pojos.Product;
import com.app.service.ICategoryService;
import com.app.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private IProductService prodService;
	@Autowired
	private ICategoryService cateService;

	public ProductController() {
		// TODO Auto-generated constructor stub
		System.out.println("in product controller");
	}

	@GetMapping("/product")
	public String inProductForm(Model map) {
		// invoke method of category service to fetch list of all avilable categories
		// System.out.println("list "+cateService.showAllCategory());
		// map.addAttribute("category_list",cateService.showAllCategory());

		return "/admin";
	}
	
	@GetMapping("/{pId}")
	public Product getById(int pId) {
		return prodService.getById(pId);
	}
	
	

	@GetMapping
	public List<Product> showAllProducts(Model map) {
		
		  System.out.println("product_list"+prodService.showAllProducts());
		 // map.addAttribute("product_list",prodService.showAllProducts());
		
		return prodService.showAllProducts();

	}
	
	@GetMapping("{/cId}")
	public List<Product> getProductByCatId(@RequestParam int cId,HttpSession session)
	{
		
	    List<Product> pCateList=prodService.getAllProductsByCatId(cId);
		session.setAttribute("pCategory_list",pCateList );
		System.out.println("in home controller"+pCateList);
		return prodService.getAllProductsByCatId(cId);
		
	}

	@PostMapping
	public String addProduct(Product product, HttpSession session, Model map) {
		System.out.println("in add cust.." + product);
		System.out.println(product.getpDesc());
		try {
			prodService.addProduct(product);
			map.addAttribute("message", " Product added successfully with the id ," + product.getpId());
            return "/admin";

		} catch (RuntimeException e) {
			map.addAttribute("message", "Some error occured ..please try again");
			return "/admin";

		}
		
	

	}

}
