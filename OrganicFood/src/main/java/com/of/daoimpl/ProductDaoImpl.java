package com.of.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session; 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.of.dao.ProductDao;
import com.of.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao
{
	@Autowired
	SessionFactory sessionFactory; 
	
	Logger log=LoggerFactory.getLogger(ProductDaoImpl.class);
	
	public ProductDaoImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	public void insertProduct(Product product){
		Session session= sessionFactory.openSession();
		session.persist(product);
		
	}

	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Product> getProducts() {
		log.info("Product Ojbect getProducts();");
		List<Product> list=(List<Product>) sessionFactory.getCurrentSession().createCriteria(Product.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		
		log.info("Product Object has been retrived");
		return list;
	}

}
