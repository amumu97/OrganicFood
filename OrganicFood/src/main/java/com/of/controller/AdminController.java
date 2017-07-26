package com.of.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.of.dao.CategoryDao;
import com.of.model.*;

@Controller
public class AdminController 
{
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping("/adding")
	public String addPage()
	{return "adding";
	}
	
	@RequestMapping(value="/saveCat", method= RequestMethod.POST)
	@Transactional
	public ModelAndView saveCategory(@RequestParam("catId") int catId, @RequestParam("name") String name)
	{
		ModelAndView mav = new ModelAndView();
		Category c= new Category();
		c.setCatId(catId);
		c.setName(name);
		categoryDao.insertCategory(c);
		mav.setViewName("index");
		return mav;
	}
	
}
