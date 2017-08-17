package com.of.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.of.dao.CategoryDao;
import com.of.model.*;

@Controller
public class CategoryController 
{
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping( value="/category",method=RequestMethod.GET)
	
	public String addPage(@ModelAttribute("category") Category category,Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("categoryList",categoryDao.getCategories());
		return "categoryForm";
	}
	
	@RequestMapping(value="/saveCategory", method= RequestMethod.POST)
	@Transactional
	public ModelAndView saveCategory(@ModelAttribute("category") Category category) {
		ModelAndView mav = new ModelAndView();
		
		categoryDao.insertCategory(category);
		mav.setViewName("categoryForm");
		return mav;
	}

//	@RequestMapping(value ="Admin" )
//	public ModelAndView AdminPage() {
//		ModelAndView mv= new ModelAndView("/Admin");
//		mv.addObject("showadminPage", "true");
//		return mv;
//	}
	
	
}
