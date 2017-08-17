package com.of.model;

import java.io.Serializable; 
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile; 

@Entity
@Component
@Table(name="Product")
public class Product implements Serializable
{
	private static final long serialVersionUID = 1L; 
	@Id
	private int pId; 
	private String name;
	private String description; 
	private Float price;
	private int stock;
	//private int Quantity; 
	private int category_id;
	private int supplier_id; 
	
	
	@Transient
	MultipartFile image;
	
	
	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="category_id", updatable = false, insertable = false, nullable = false)
	private Category category;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="supplier_id", updatable = false, insertable = false, nullable = false)
	private Supplier supplier;

	public int getId() {
		return pId;
	}

	public void setId(int pId) {
		this.pId = pId;
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;	
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}
	

}
