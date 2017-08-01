package com.of.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session; 
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.of.dao.CategoryDao;
import com.of.model.Category;

@SuppressWarnings("unused")
@Repository
public class CategoryDaoImpl implements CategoryDao
{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	Logger log=LoggerFactory.getLogger(CategoryDaoImpl.class);

	@Transactional
	public void insertCategory(Category category) {
		
		
		log.info("Category save operation start");
		sessionFactory.getCurrentSession().saveOrUpdate(category);
		log.info("Category Object has been saved successfully");
		
			}



	@SuppressWarnings("unchecked")
	@Transactional
	public List<Category> getCategories() {
	
		log.info("Category Ojbect getCateogryies();");
		List<Category> list=(List<Category>) sessionFactory.getCurrentSession().createCriteria(Category.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		
		log.info("Category Object has been retrived");
		return list;
	}
	
	}