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
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.of.dao.CartDao;
import com.of.model.Cart;

@SuppressWarnings("unused")
@Repository
public class CartDaoImpl implements CartDao {


	@Autowired
	private SessionFactory sessionFactory;
	
	Logger log=LoggerFactory.getLogger(CartDaoImpl.class);
	
	public void insert(Cart cart) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.persist(cart);
		session.getTransaction().commit();
	}
	  
	@Transactional
	public boolean update(Cart cart) {
		try {
			sessionFactory.getCurrentSession().update(cart);
			return true;
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
	}

	@Transactional
	public boolean delete(Cart cart) {
		try {
			sessionFactory.getCurrentSession().delete(cart);
			return true;
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}

	}
	
	@Transactional
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Cart> list() {
		
		List<Cart> listCart = (List<Cart>)sessionFactory.getCurrentSession()
						.createCriteria(Cart.class)
						.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCart;
		
	}

	@SuppressWarnings({ "unchecked", "rawtypes", "deprecation" })
	@Transactional
	public List<Cart> get(int cartUserId) {
		String hql = "from"+" Cart"+" where userid="+ cartUserId+"and status='C'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		List<Cart> list= (List<Cart>)query.list();
		return list;
	 
	}
	@Transactional
	@SuppressWarnings({ "unchecked", "deprecation" })
	public Cart getproduct(int cartProductId,int cartUserId) {
		String hql = "from"+" Cart"+" where Status='C'and cartUserId="+cartUserId+" and cartProductId="+cartProductId;
		
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Cart>listproduct=query.list();
		
		if(listproduct.isEmpty()){
		
			return null;
		}
		else
		{
			System.out.println("product");
			return listproduct.get(0);
		}
	}
	
	@Transactional
	public void pay(int userId) {
		String hql="update Cart set status='P' where userid="+userId;	
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.executeUpdate();
	}
	

	@SuppressWarnings("deprecation")
	@Transactional
	public long CartPrice(int userId) {
		Criteria c=sessionFactory.getCurrentSession().createCriteria(Cart.class);
		c.add(Restrictions.eq("userid", userId));
		c.add(Restrictions.eq("status","C"));
		c.setProjection(Projections.sum("price"));
		Long l= (Long)c.uniqueResult();
		return l;
	}
	
	
	@SuppressWarnings("deprecation")
	@Transactional
	public long cartsize(int userId) {
		Criteria c=sessionFactory.getCurrentSession().createCriteria(Cart.class);
		c.add(Restrictions.eq("userid", userId));
		c.add(Restrictions.eq("status","C"));
		c.setProjection(Projections.count("userid"));
		Long count=(Long) c.uniqueResult();
		return count;
	}
	
	@Transactional
	public boolean saveorupdate(Cart cart) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate (cart);
			return true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		
		}
	}

	
	public Cart getitem(int cartId) {String hql = "from"+" Cart"+" where id="+cartId;
	@SuppressWarnings("rawtypes")
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	
	@SuppressWarnings({"unchecked", "deprecation"})
	List<Cart> list = (List<Cart>) query.list();
	if (list!= null && !list.isEmpty()) {
		return list.get(0);
	}
	return null;
}
	
}
