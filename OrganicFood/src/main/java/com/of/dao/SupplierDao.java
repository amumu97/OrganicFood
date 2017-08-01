package com.of.dao;

import java.util.List;
import com.of.model.Supplier;

public interface SupplierDao {
	
	public void insertSupplier(Supplier supplier);
	public List<Supplier> getSuppliers();

}

