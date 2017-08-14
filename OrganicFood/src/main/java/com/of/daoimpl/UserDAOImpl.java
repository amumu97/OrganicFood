package com.of.daoimpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.of.dao.UserDao;
import com.of.model.Users;

public class UserDAOImpl implements UserDao {

	@Autowired
	
	SessionFactory sessionFactory;
	
	@Transactional
	public boolean saveUser(Users user) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		return true;
	}

	public Users get(String email) {
		return null;
	}

//	@Transactional
//	public boolean delete(Users user) {
//		try {
//			sessionFactory.getCurrentSession().delete(user);
//			return true;
//		
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//			
//		}
//	}
}
