package com.of.dao;

import java.util.List;

import com.of.model.*;

public interface ProductDao {
	
	public void insertProduct(Product product);

	public List<Product> getProducts();


}
