package com.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.CategoryRepository;
import com.app.exceptions.ProductException;
import com.app.pojos.Category;
import com.app.pojos.Product;

@Service
@Transactional
public class CategoryServiceImpl implements ICategoryService {

	@Autowired
	private CategoryRepository cateRepo;
	
	public CategoryServiceImpl() {
		// TODO Auto-generated constructor stub
	System.out.println("in category service layer");
	}
	

	@Override
	public Category addCategory(Category category) {
		// TODO Auto-generated method stub
		return cateRepo.save(category);
	}


	@Override
	public List<Category> showAllCategory(){
		return cateRepo.findAll();
	}


	@Override
	public Category getCatById(int cId) {
		// TODO Auto-generated method stub
		Optional<Category> optCategory=cateRepo.findById(cId);
		Category category=optCategory.orElseThrow(()-> new ProductException("Id is invalid ...category not found"));
		return category;
	}
	

}
