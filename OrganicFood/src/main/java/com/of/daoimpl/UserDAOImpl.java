package com.of.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
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

	
	@SuppressWarnings("deprecation")
	@Transactional
	public Users get(String email) {
		Criteria c = sessionFactory.getCurrentSession().createCriteria(Users.class);
		c.add(Restrictions.eq("email", email));

		@SuppressWarnings("unchecked")
		List<Users> listUser = (List<Users>) c.list();

		if (listUser != null && !listUser.isEmpty()) {
			return listUser.get(0);
		} else {
			return null;
		}

	}
}
