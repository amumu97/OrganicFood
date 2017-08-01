package com.of.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session; 
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.of.dao.*;
import com.of.model.*;

@Repository
public class SupplierDaoImpl implements SupplierDao {

	@Autowired
	SessionFactory sessionFactory;
	public SupplierDaoImpl(SessionFactory sessionFactory){
		this.sessionFactory= sessionFactory;
	}

	public void insertSupplier(Supplier supplier){
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(supplier);
		session.getTransaction().commit();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Supplier> getSuppliers() {
		List<Supplier> list=(List<Supplier>) sessionFactory.getCurrentSession().createCriteria(Supplier.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return list;
	}
}
