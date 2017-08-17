package com.of.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.of.dao.CartDao;
import com.of.dao.CategoryDao;
import com.of.dao.ProductDao;
import com.of.model.Cart;
import com.of.model.Product;

@Controller
public class CartController {
	
	@Autowired
	 private CartDao cartDao;
	
	@SuppressWarnings("unused")
	 @Autowired
	 private CategoryDao categoryDao;
	
	 @Autowired
	 private ProductDao productDao;
	 
	 public static final Logger log=LoggerFactory.getLogger(CartController.class);

	 int quant;
	 
	 @RequestMapping(value={"addtocart/{id}","navproducts/addtocart/{id}","addtoCart/{userid}/{id}"})
	 public String addToCart(
			 @ModelAttribute("cart")Cart cart,
			 BindingResult result,
			 @PathVariable("userid") int userid,
			 @PathVariable("id") int productid,
			 HttpSession session) throws Exception{
	 
	  float p;
	  if(cartDao.getproduct(productid,userid)==null){
	   Cart my2Cart= new Cart(); 
	   Product product = productDao.get(productid);
	   my2Cart.setCartProductId(product.getId());
	   my2Cart.setCartProductName(product.getName());
	   my2Cart.setCartPrice(product.getPrice());
	   my2Cart.setCartQuantity(1);
	   quant=my2Cart.getCartQuantity();
	   my2Cart.setStatus("C");
	   my2Cart.setCartUserId(userid);
	 
	   	cartDao.saveorupdate(my2Cart);
	   	session.setAttribute("cartsize", cartDao.cartsize( (Integer) session.getAttribute("userid")));
	 
	   	log.info("Save Successful");
	            return "redirect:/Cart";
	  }else{
	   Cart my1Cart = cartDao.getproduct(productid,userid);
	   Product my1product = productDao.get(productid);
	   quant=my1Cart.getCartQuantity();
	   my1Cart.setStatus("C");
	   
	   p=my1product.getPrice();
	   quant+=1;
	   p=quant*p;
	
	   my1Cart.setCartQuantity(quant);
	   my1Cart.setCartPrice(p);
	
	cartDao.saveorupdate(my1Cart);
	session.setAttribute("cartsize", cartDao.cartsize( (Integer) session.getAttribute("userId")));
	System.out.println("opeartion over");

	log.info("Cart Operation Completed!");
	return "redirect:/Cart";
	  } 
	  
	 }
	 
	 @RequestMapping(value="update/{id}")
		public String update(@ModelAttribute("cart") Cart cart){
			cartDao.update(cart);
			return "redirect:/Cart";
		}
	 
	 @RequestMapping(value="delete/{id}")
	 public String delete(@ModelAttribute("cart") Cart cart,HttpSession session){
	  cartDao.delete(cart);
	  session.setAttribute("cartsize", cartDao.cartsize( (Integer) session.getAttribute("userid")));
	  return "redirect:/Cart";
	 }
	 
	 @RequestMapping("editorder/{id}")
		public String editorder(@PathVariable("id") int id, @RequestParam("quantity") int quan, HttpSession session) {
			Cart cart = cartDao.getitem(id);
			Product product = productDao.get(cart.getCartProductId());
			cart.setCartQuantity(quan);
			cart.setCartPrice(quan * product.getPrice());
			cartDao.saveorupdate(cart);
			session.setAttribute("cartsize", cartDao.cartsize((Integer) session.getAttribute("userid")));
			return "redirect:/Cart";
		}

	 @RequestMapping(value="/Cart")
	 public ModelAndView cartpage(@ModelAttribute("cart") Cart cart,HttpSession session){
	  ModelAndView mv= new ModelAndView("index");
	  int userid = (Integer) session.getAttribute("userid");
	  mv.addObject("CartList", cartDao.get(userid));
	  if(cartDao.cartsize((Integer) session.getAttribute("userid"))!=0){
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
//	 @RequestMapping("pay")
//	 public String payment(HttpSession session) {
//	  cartDao.pay((Integer) session.getAttribute("userid"));
//	  return "home";
//	 }
	
	}