package com.of.daoimpl;

import org.hibernate.Session; 
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transaction;

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
}
