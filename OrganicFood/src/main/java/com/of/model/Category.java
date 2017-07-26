package com.of.model;

import java.io.Serializable; 
import java.util.HashSet; 
import java.util.Set; 
import javax.persistence.Column; 
import javax.persistence.Entity; 
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id; 
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component; 



@SuppressWarnings("unused")
@Entity
@Component
@Table(name="Category")
public class Category {
	
	@Id
	@GeneratedValue
	private int catId;
	private String name;
	private String description; 
	//@OneToMany(targetEntity=Product.class, fetch=FetchType.EAGER, mappedBy="Category")
	//private Set<Product> products = new HashSet<Product>(0); 
	
	public int getCatId() {
		return catId;
	}
	
	public void setCatId(int catId) {
		this.catId = catId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
//	
//	public Set<Product> getProducts() {
//		return products;
//	}
//	
//	public void setProducts(Set<Product> products) {
//		this.products = products;
//	}
//
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
