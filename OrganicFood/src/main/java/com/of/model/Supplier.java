package com.of.model;

import java.io.Serializable; 
import java.util.HashSet; 
import java.util.Set; 
import javax.persistence.Column; 
import javax.persistence.Entity; 
import javax.persistence.FetchType; 
import javax.persistence.Id; 
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component; 


@SuppressWarnings("unused")
@Entity
@Component
@Table(name="Supplier")
public class Supplier {
@Id
private int id;
private String supplierName;
//@OneToMany(targetEntity=Product.class, fetch=FetchType.EAGER, mappedBy="Supplier")
//private Set<Product> product= new HashSet<Product>(0);


public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getSupplierName() {
	return supplierName;
}
public void setSupplierName(String supplierName) {
	this.supplierName = supplierName;
//}
//public Set<Product> getProduct() {
//	return product;
//}
//public void setProduct(Set<Product> product) {
//	this.product = product;
//}

}

}
