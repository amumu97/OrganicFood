package com.of.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.of.dao.UserDao;
import com.of.model.Users;

@Controller
public class HomeController {
	

	@Autowired
	UserDao userDao;
	
	@RequestMapping(value="/")
	public String landPage(@ModelAttribute("Users")Users users,BindingResult result,Model model)
	{
		return "index";
		
	}
	

	@RequestMapping(value="/register")
	public String registrationPage(Model model)
	{
		model.addAttribute("users", new Users());
		return "registration";
		
	}
	
	@RequestMapping(value="/login")
	public String login()
	{
		return "/login";
		
	}
	
	@RequestMapping(value="/userLogged")
	public String userLogged()
	{
		return "redirect:/index";
		
	}
	
	@RequestMapping(value="/error")
	public String errorPage()
	{
		return "/error";
		
	}
	
	@RequestMapping(value="/saveUser",method = RequestMethod.POST)
	public String addUser(@ModelAttribute("users")Users users)
	{
		
		users.setRole("ROLE_USER");
		userDao.saveUser(users);
		
		return "redirect:/login";
		
	}
}