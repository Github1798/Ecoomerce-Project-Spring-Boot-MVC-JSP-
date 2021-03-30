package com.app.service;

import java.util.List;

import com.app.pojos.Product;

public interface IProductService {
	
		List<Product> showAllProducts();
		public Product getById(int pId);
		Product addProduct(Product product);
		public List<Product> getAllProductsByCatId(Integer cId);

		

}
