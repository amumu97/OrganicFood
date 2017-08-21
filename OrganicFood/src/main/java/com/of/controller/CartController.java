package com.of.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.of.dao.CartDao;
import com.of.dao.CategoryDao;
import com.of.dao.ProductDao;
import com.of.dao.UserDao;
import com.of.model.Cart;
import com.of.model.Product;
import com.of.model.Users;

@Controller
public class CartController {
	
	@Autowired
	 private CartDao cartDao;
	
	@SuppressWarnings("unused")
	 @Autowired
	 private CategoryDao categoryDao;
	
	 @Autowired
	 private ProductDao productDao;
	 
	 @SuppressWarnings("unused")
	 @Autowired
	 private UserDao userDao;
	
	 public static final Logger log=LoggerFactory.getLogger(CartController.class);

	 int quant;
	 

//	 @RequestMapping(value="/checkout")
//	 public String checkoutPage (Model model)
//		{
//		 model.addAttribute("checkout", cartDao.pay(userid));
//			return "checkout";
//			
//		}
	 
	 @RequestMapping(value="addtoCart/{id}")
	    public String addProductToCart(@PathVariable("id") int productid, HttpSession session,Model model)
	    { 		 
		 log.info("User Id in session:"+session.getAttribute("userid"));
		 int uid=(Integer) session.getAttribute("userid");
		 log.info("User Id =================:"+uid);
		 
	  float p;
	  if(cartDao.getitem(productid,uid)==null){
	   Cart my2Cart= new Cart(); 
	   Product product = productDao.get(productid);
	   my2Cart.setCartProductId(product.getId());
	   my2Cart.setCartProductName(product.getName());
	   my2Cart.setCartPrice(product.getPrice());
	   my2Cart.setCartQuantity(1);
	   quant=my2Cart.getCartQuantity();
	   my2Cart.setStatus("C");
	   my2Cart.setUserid(uid);
	 
	   cartDao.saveorupdate(my2Cart);
	   session.setAttribute("cartsize", cartDao.cartSize( (Integer) session.getAttribute("userid")));
	 
	   	log.info("Save Successful");
	            return "cartPage";
	  }else{
	   Cart my1Cart = cartDao.getitem(productid, uid);
	   Product my1product = productDao.get(productid);
	   quant=my1Cart.getCartQuantity();
	   my1Cart.setStatus("C");
	   
	   p=my1product.getPrice();
	   quant+=1;
	   p=quant*p;
	
	   my1Cart.setCartQuantity(quant);
	   my1Cart.setCartPrice(p);
	   my1Cart.setUserid(uid);
	
	cartDao.saveorupdate(my1Cart);
	session.setAttribute("cartsize", cartDao.cartSize( (Integer) session.getAttribute("userid")));
	System.out.println("operation over");
	log.info("Cart Operation Completed!");
	return "redirect:/Cart";
	  } 
	  
	 }
	 
	 @RequestMapping(value="/yourCart")
		public String cartPage(Model model)
		{
		 model.addAttribute("cart", new Cart());
		 model.addAttribute("cartList", cartDao.list());
		 
			return "cartPage";
			
		}
	 
	 @RequestMapping(value="update/{id}")
		public String update(@ModelAttribute("cart") Cart cart){
			cartDao.update(cart);
			return "redirect:/Cart";
		}
	 
	 @RequestMapping(value="delete/{id}")
	 public String delete(@ModelAttribute("cart") Cart cart,HttpSession session){
	  cartDao.delete(cart);
	  session.setAttribute("cartsize", cartDao.cartSize( (Integer) session.getAttribute("userid")));
	  return "redirect:/Cart";
	 }
	 
	 @RequestMapping("editorder/{id}")
		public String editorder(@PathVariable("id") int id, @RequestParam("quantity") int quan, HttpSession session) {
			Cart cart = cartDao.getitem(id);
			Product product = productDao.get(cart.getCartProductId());
			cart.setCartQuantity(quan);
			cart.setCartPrice(quan * product.getPrice());
			cartDao.saveorupdate(cart);
			session.setAttribute("cartsize", cartDao.cartSize((Integer) session.getAttribute("userid")));
			return "redirect:/Cart";
		}

	 @RequestMapping(value="/Cart")
	 public ModelAndView cartpage(@ModelAttribute("cart") Cart cart,HttpSession session){
	  ModelAndView mv= new ModelAndView("index");
	  int userid = (Integer) session.getAttribute("userid");
	  mv.addObject("CartList", cartDao.get(userid));
	  if(cartDao.cartSize((Integer) session.getAttribute("userid"))!=0){
		   mv.addObject("cartprice", cartDao.CartPrice((Integer) session.getAttribute("userid")));
	  }else{
		  
	  mv.addObject("emptycart","Sorry, your shopping cart is empty");
	  }
	  mv.addObject("UserClickedCart","true");
	  return mv;
	  }
	 
//	 @RequestMapping("placeorder")
//	 public String placeorder(Model model)
//	 {
//	  model.addAttribute("IfPaymentClicked", "true");
//	  model.addAttribute("HideOthers","true");
//	  return "Payment";
//	 }
//
     @RequestMapping("pay")
	 public String payment(HttpSession session) {
	  cartDao.pay((Integer) session.getAttribute("userid"));
	  return "home";
     }
	
	}