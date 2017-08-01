package com.of.dao;


import java.util.List;

import com.of.model.Category;

public interface CategoryDao {
	
	public void insertCategory(Category category); 

	public List<Category> getCategories();

}
