package com.of.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.of.dao.*;
import com.of.daoimpl.CartDaoImpl;
import com.of.daoimpl.CategoryDaoImpl;
import com.of.daoimpl.ProductDaoImpl;
import com.of.daoimpl.SupplierDaoImpl;
import com.of.daoimpl.UserDAOImpl;


@Configuration
@ComponentScan("com.of")
@EnableTransactionManagement
@EnableWebMvc
public class DBConfig {

	@Bean(name ="dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/test");
		dataSource.setUsername("sa");
		dataSource.setPassword("");
		System.out.println("Datasource");
		return dataSource;

	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		properties.put("hibernate.hbm2ddl.auto", "update");
		System.out.println("Hibernate Properties");
		return properties;

	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.scanPackages("com.of");
		System.out.println("Session");
		return sessionBuilder.buildSessionFactory();
		
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		System.out.println("Transaction");
		return transactionManager;
	}
	
	@Autowired
	@Bean(name="productDao")
	public ProductDao getProductDAO(SessionFactory sessionFactory){
		return new ProductDaoImpl(sessionFactory);
	}
	
	
	@Autowired
	@Bean(name="supplierDao")
	public SupplierDao getSupplierDAO(SessionFactory sessionFactory){
		return new SupplierDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="categoryDao")
	public CategoryDao getCategoryDAO(SessionFactory sessionFactory) {
		return new CategoryDaoImpl();
	}

	@Autowired
	@Bean(name="cartDao")
	public CartDao getCartDAO(SessionFactory sessionFactory) {
		return new CartDaoImpl();
	}
	
	@Autowired
	@Bean(name = "userDao")
		public UserDao getUserDetailsDAO(SessionFactory sessionFactory) {
			return new UserDAOImpl();
	}
	
}
	