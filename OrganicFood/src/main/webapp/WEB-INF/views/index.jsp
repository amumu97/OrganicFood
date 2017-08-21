<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">  
<head> 
	<script src="//code.jquery.com/jquery.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
    
</head> 
<body>  

<nav class="navbar navbar-inverse">  
  <div class="container-fluid"> </div>  
    
     <div class="navbar-header">  
      <a class="navbar-brand" href="#">The Warehouse</a>
   	</div> 
   	
   	<form class="navbar-form navbar-left">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
      <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li>
             <a href="yourCart" id="cart-popover" class="btn" data-placement="bottom" title="Your Cart"> Your Cart 
             <span class="glyphicon glyphicon-shopping-cart"></span></a>
      </li>
      <li><a href="<c:url value="j_spring_security_logout" />">Logout</a>
     </ul>
   
</nav>

<div class="container">
		<c:forEach items="${Plist}" var="product">
			<h2 style="color: red"> <c:out value="${product.name }" /> </h2>

			<div class="col-xs-6 w3-animate-left">
				<div class="img">
				
	
				 	<img alt="" class="thumbnail" src="OrganicFood/image/imageDisplay?pId=${product.id}" style="width: 100px;height: 100px"> 
				 
				 <div class="desc"> </div>
				</div>
			</div>

			<div class="col-xs-4 ">
				<div class="img">
					<div class="desc">
						<p>
						
						<div class="form-group">
							<input type="text" class="form-control" value="${product.name}" readonly="readonly">
						</div>

						<div class="form-group">
							<input type="text" class="form-control" value="Rs. ${product.price}" readonly="readonly">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" value="${product.description}" readonly="readonly">
						</div>
						<div>
						
						<a href="addtoCart/${product.id}" class="btn btn-primary">Add to Cart</a>
						
						</form>
  
						</div></div></div></div></c:forEach>
						</div>
		






</body> 

<jsp:include page="footer.jsp"></jsp:include>
 
</html>  

