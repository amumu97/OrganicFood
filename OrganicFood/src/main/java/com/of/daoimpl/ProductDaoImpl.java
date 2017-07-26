package com.of.daoimpl;

import org.hibernate.Session; 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.of.dao.ProductDao;
import com.of.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao
{
	@Autowired
	SessionFactory sessionFactory; 
	
	public ProductDaoImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	public void insertProduct(Product product){
		Session session= sessionFactory.openSession();
		session.persist(product);
		
	}

}
