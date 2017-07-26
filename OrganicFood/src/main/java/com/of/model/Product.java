package com.of.model;

import java.io.Serializable; 
import javax.persistence.Entity; 
import javax.persistence.FetchType; 
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component; 

@Entity
@Component
@Table(name="Product")
public class Product implements Serializable
{
	private static final long serialVersionUID = 1L; 
	@Id
	private int id; 
	private String name;
	private String description; 
	private Float price;
	private int stock; 
	
	//@ManyToOne(fetch=FetchType.LAZY)
	//@JoinColumn(name="catId")
	//private Category category;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
//
//	public Category getCategory() {
//		return category;
//	}
//
//	public void setCategory(Category category) {
//		this.category = category;
//	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
