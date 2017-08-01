package com.of.model;

import java.io.Serializable; 
import java.util.HashSet; 
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column; 
import javax.persistence.Entity; 
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id; 
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.springframework.stereotype.Component; 


@SuppressWarnings("unused")
@Entity
@Component
@Table(name="Supplier")
public class Supplier {
	
	
	
@Id
@Column(name="supplier_id")
@GeneratedValue
private int sId;


private String supplierName;
@OneToMany(fetch=FetchType.EAGER, mappedBy="supplier",cascade=CascadeType.ALL)
private Set<Product> product= new HashSet<Product>(0);


public int getId() {
	return sId;
}
public void setId(int sId) {
	this.sId = sId;
}
public String getSupplierName() {
	return supplierName;
}
public void setSupplierName(String supplierName) {
	this.supplierName = supplierName;
}
public Set<Product> getProduct() {
	return product;
}
public void setProduct(Set<Product> product) {
	this.product = product;
}

}


