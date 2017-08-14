package com.of.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.of.dao.UserDao;
import com.of.dao.CategoryDao;
import com.of.dao.SupplierDao;

import com.of.model.Product;
import com.of.model.Users;

@Controller
public class HomeController {
	

	@Autowired
	UserDao userDao;
	SupplierDao supplierDao;
	CategoryDao categoryDao;
	
	
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
	    public String login(@RequestParam(value="invalid",required=false) String error,
	    @RequestParam(value="logout",required=false) String logout, Model model)
	 
	 	{
		 if(error!=null) 
    		model.addAttribute("invalid","Username and Password Invalid! Please try again.");
		 
		 if(logout!=null)
	    		model.addAttribute("logout","You have logged out successfully!");
	    		model.addAttribute("LoginPageClicked", true);
	    	return "/login";
	    	
	    }
	
	 
	 @SuppressWarnings("unchecked")
		@RequestMapping(value = "/login_session_attributes")
		public String login_session_attributes( HttpSession session, Model model ) 
	 {
			String email = SecurityContextHolder.getContext().getAuthentication().getName();
			Users user = userDao.get(email);
			session.setAttribute("userid", user.getId());
			session.setAttribute("name", user.getEmail());
			session.setAttribute("LoggedIn", "true");

			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
			.getAuthentication().getAuthorities();
			String role="ROLE_USER";
			for (GrantedAuthority authority : authorities) 
			{
			  
			     if (authority.getAuthority().equals(role)) 
			     {
			    	 session.setAttribute("UserLoggedIn", "true");
			    	 return "redirect:/";
			    	 
			     }
			     else 
			     {
			    	 session.setAttribute("Administrator", "true");
			    	 model.addAttribute("product",  new Product());
			    	 model.addAttribute("ProductPageClicked", "true");
			    	 model.addAttribute("supplierList",supplierDao.getSuppliers());
			    	 model.addAttribute("categoryList",categoryDao.getCategories());
				 return "/index";
				 
			     }
		}
			return "/index";
		
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
	public String addUser(@ModelAttribute("users")Users users, RedirectAttributes attributes)
	{
	
		users.setRole("ROLE_USER");
		users.setEnabled(true);
		userDao.saveUser(users);
		if(userDao.saveUser(users)==true)
	       {
	    	   attributes.addFlashAttribute("registered", "Registration Successful! Thank You.");
	       
	       }
		
	       else
	       {
	        	attributes.addFlashAttribute("registered","Registration failed, please try again.");
	       
	       }
		
		return "redirect:/login";
		}
}
	