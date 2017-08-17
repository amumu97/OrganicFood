package com.of.dao;

import java.util.List;

import com.of.model.Cart;

public interface CartDao {
	public List<Cart> list();

	public boolean saveorupdate(Cart cart);

	public boolean update(Cart cart);

	public boolean delete(Cart cart);

	public List<Cart> get(int userid);
	
	public Cart getitem(int cartId);

	public Cart getproduct(int id,int userid);

	public long cartsize(int userId);

	public long CartPrice(int userId);

	public void pay(int userId);
}