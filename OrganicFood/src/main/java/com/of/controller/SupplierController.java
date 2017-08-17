package com.of.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.of.dao.SupplierDao;
import com.of.model.Supplier;

@Controller
public class SupplierController {
	
	@Autowired
	SupplierDao supplierDao;
	
    @RequestMapping(value="/supplier", method= RequestMethod.GET)
	
    public String addSupplierPage(@ModelAttribute("supplier") Supplier supplier,Model model)
	
	{
    	model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierList",supplierDao.getSuppliers());
        return "supplierForm";
}

	@RequestMapping(value="/saveSupplier", method= RequestMethod.POST)
	@Transactional
	public ModelAndView saveSupplier(@ModelAttribute("supplier")Supplier supplier)
	{
		ModelAndView mav = new ModelAndView();
		
		supplierDao.insertSupplier(supplier);
		mav.setViewName("supplierForm");
		return mav;
	}

}
