package com.app.service;



import java.util.List;

import com.app.pojos.Category;

public interface ICategoryService {
	
	public Category addCategory(Category category);
    public Category getCatById(int cId);
	public List<Category> showAllCategory();
	
}
