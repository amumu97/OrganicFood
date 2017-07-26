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
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		
		return true;
	}

}
