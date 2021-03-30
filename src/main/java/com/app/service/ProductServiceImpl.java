package com.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.CategoryRepository;
import com.app.dao.ProductRepository;
import com.app.exceptions.ProductException;
import com.app.pojos.Category;
import com.app.pojos.Product;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

	
	 @Autowired
	 private ProductRepository prodRepo;
	 @Autowired
	 private CategoryRepository catRepo;
	 
	 public ProductServiceImpl() {
		// TODO Auto-generated constructor stub
	System.out.println("in productService constru...");
	 }
	 
	@Override
	public List<Product> showAllProducts() {
		// TODO Auto-generated method stub
		return prodRepo.findAll();
	}

	@Override
	public Product addProduct(Product product) {
		return prodRepo.save(product);
	}
     
	public List<Product> getAllProductsByCatId(Integer cId){
		System.out.println("in service");
		Category cat=catRepo.findById(cId).get();
		List<Product> plist= prodRepo.findAllByCategory(cat);
		System.out.println(plist);
		return plist;
	}
	@Override
	public Product getById(int pId) {
		// TODO Auto-generated method stub
		Optional<Product> optProduct=prodRepo.findById(pId);
		Product product=optProduct.orElseThrow(()-> new ProductException("Id is invalid ...cust not found"));
		return product;
	}

	
	
}
