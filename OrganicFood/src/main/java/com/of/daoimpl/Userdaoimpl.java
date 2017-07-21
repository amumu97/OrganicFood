package com.of.daoimpl;

import org.hibernate.HibernateException;
import org.hibernate.Session; 
import org.hibernate.SessionFactory;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.of.dao.UserDao;
import com.of.model.Users;

@Repository
public class Userdaoimpl implements UserDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(Userdaoimpl.class);
	
	@Transactional
	public boolean saveUser(Users user) {
		
		try {
			logger.info("User save operation start");
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		logger.debug("User object saved successfually");
			return true;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	

	
	
	
}