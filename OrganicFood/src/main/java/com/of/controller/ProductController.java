package com.of.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.of.dao.CategoryDao;
import com.of.dao.ProductDao;
import com.of.dao.SupplierDao;
import com.of.model.Product;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ProductController {
	
	
	@Autowired
	SupplierDao supplierDao;

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;
	
	Logger log=LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping( value="/product",method=RequestMethod.GET)

    public String addPage(@ModelAttribute("product") Product product, Model model)
	
	{
		model.addAttribute("productList", productDao.getProducts());
		model.addAttribute("categoryList", categoryDao.getCategories());
		model.addAttribute("supplierList", supplierDao.getSuppliers());
		
		return "productForm";
	}
	
	
	
	@RequestMapping(value="/saveProduct", method= RequestMethod.POST)
	@Transactional
	public String saveProduct(@ModelAttribute("product") Product product,
		@RequestParam("file") MultipartFile file, 
			HttpServletRequest request, 
			Model model) throws IOException{
		
		
		product.setImage(file.getBytes());
		productDao.insertProduct(product);
		

		return "redirect:/product";
		
		
	}
	@RequestMapping(value="editproduct/{id}",method=RequestMethod.GET)
	public String editProduct(@PathVariable("id") int id,RedirectAttributes attributes)
	{
		attributes.addFlashAttribute("product", this.productDao.get(id));
		return "redirect:/product";
	   }
	
	@RequestMapping(value="removeproduct/{id}",method=RequestMethod.GET)
	public String removeProduct(@PathVariable("id") int id,RedirectAttributes attributes)
	{
		productDao.remove(id);
		attributes.addFlashAttribute("DeleteMessage", "Product has been deleted Successfully");
		return "redirect:/product";
	   }
	
	
	
	
	
	
}
