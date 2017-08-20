package com.of.dao;

import java.util.List;

import com.of.model.Cart;

public interface CartDao {
	
	public void insert(Cart cart);
	
	public boolean update(Cart cart);

	public boolean delete(Cart cart);
	
	public boolean saveorupdate(Cart cart);
	
	public List<Cart> list();
	
	public List<Cart> get(int userid);
	
	public Cart getitem(int cartId);

	public Cart getitem(int prodId,int userId);
	
	public void pay(int userId);
	
	public Double CartPrice(int userId);

	public long cartSize(int userId);

	
}