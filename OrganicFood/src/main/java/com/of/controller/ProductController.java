package com.of.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.of.dao.ProductDao;
import com.of.model.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDao productDao;
	
	@RequestMapping( value="/product",method=RequestMethod.GET)
	
	
//	PRODUCT FORM 
	
    public String addPage(@ModelAttribute("product") Product product, Model model)
	
	{
		model.addAttribute("productList",productDao.getProducts());
		return "productForm";
	}
	
	@RequestMapping(value="/saveProduct", method= RequestMethod.POST)
	@Transactional
	public ModelAndView saveProduct(@ModelAttribute("product") Product product)
	{
		ModelAndView mav = new ModelAndView();
		
		productDao.insertProduct(product);
		mav.setViewName("productForm");
		return mav;
	}

	
}
