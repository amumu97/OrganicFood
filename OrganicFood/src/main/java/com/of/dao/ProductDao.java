package com.of.dao;

import java.util.List;

import com.of.model.*;

public interface ProductDao {
	
	public void insertProduct(Product product);

	public List<Product> getProducts();

	public Product get(int id);

	public Product remove(int id);
	
}
