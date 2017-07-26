package com.of.daoimpl;

import org.hibernate.HibernateException;
import org.hibernate.Session; 
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.of.dao.CategoryDao;
import com.of.model.Category;

@SuppressWarnings("unused")
@Repository
public class CategoryDaoImpl implements CategoryDao
{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void insertCategory(Category category) {
		
		
		Session session=sessionFactory.getCurrentSession();

		Transaction tx=session.beginTransaction();
		
		session.saveOrUpdate(category);
		
		tx.commit();
	}
	
	}