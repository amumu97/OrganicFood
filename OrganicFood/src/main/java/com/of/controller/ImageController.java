package com.of.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.of.dao.ProductDao;
import com.of.model.Product;

@Controller
public class ImageController {
	
@Autowired
private ProductDao productDao;


@RequestMapping(value = "image/imageDisplay", method=RequestMethod.GET)
public void showImage(@RequestParam("id") Integer pId, HttpServletResponse response, HttpServletRequest request) 
		throws ServletException, IOException {
	
	Product product= productDao.get(pId);
	response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
	response.getOutputStream().write(product.getImage());
	response.getOutputStream().close();
}
}