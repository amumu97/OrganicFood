package com.of.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.of.dao.ProductDao;
import com.of.model.Product;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ProductController {
	
	Logger log=LoggerFactory.getLogger(ProductController.class);
	@Autowired
	ProductDao productDao;
	
	@RequestMapping( value="/product",method=RequestMethod.GET)

    public String addPage(@ModelAttribute("product") Product product, Model model)
	
	{
		model.addAttribute("productList",productDao.getProducts());
		return "productForm";
	}
	
	
	
	@RequestMapping(value="/saveProduct", method= RequestMethod.POST)
	@Transactional
	public ModelAndView saveProduct(@ModelAttribute("product") Product product, HttpServletRequest request, Model model){
	MultipartFile file =product.getImage();
	String rootDirectory = request.getSession().getServletContext().getRealPath("/");
	Path path = Paths.get(rootDirectory + "//resources//images//"+product.getId()+".jpg");

	ModelAndView mav = new ModelAndView();
	
	if (file != null && !file.isEmpty()) {
		try {
			log.info("Product Image Save operation has Started");
			file.transferTo(new File(path.toString()));
			log.info("Product Image has been saved successfully");		
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Error");
		throw new RuntimeException("Item image saving failed", e);
			}
		}
	
	productDao.insertProduct(product);
	mav.setViewName("productForm");
	return mav;
	
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
