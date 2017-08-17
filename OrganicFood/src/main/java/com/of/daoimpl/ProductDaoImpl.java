package com.of.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session; 
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
		log.info("Product Object getProducts();");
		List<Product> list=(List<Product>) sessionFactory.getCurrentSession().createCriteria(Product.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		
		log.info("Product Object has been retrived");
		return list;
	}

	@Transactional
	public Product get(int pId) {
		
		log.debug("starting of the method get");
		log.info("trying to get product based on id:" + pId);
		
		String hql = "from Product where id= " + "'" + pId + "'";
		
		log.info("the hsql query is :" + hql);
		
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>)query.list();
		
		if (list!= null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;

	
	}
	
	@Transactional
	public Product remove(int pId) {
		Product deletingProduct = new Product();
		deletingProduct.setId(pId);
		sessionFactory.getCurrentSession().delete(deletingProduct);
		return deletingProduct;
	}

}
