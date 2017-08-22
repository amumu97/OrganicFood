<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> 
	<link rel="stylesheet" href="<c:url value="/resources/css/cart.css"/>"> 
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>CartPage</title>
</head>
<style>

.nav{
	padding-right: 10px;
	padding-left: 10px;

}

</style>
<body>
<!-- NAVBAR START -->

	<nav class="navbar navbar-inverse">
	<div class="container-fluid"></div>

	<div class="navbar-header">
		<a class="navbar-brand" href="/">The Warehouse</a>
	</div>

	<form class="navbar-form navbar-left">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Search">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	<ul class="nav navbar-nav navbar-right">

		<sec:authorize access="!isAuthenticated()">
			<li><a href="register"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
		<li><a href="home"><span class="glyphicon glyphicon-user"> Welcome:<sec:authentication property="principal.username"/></span></a></li>
		</sec:authorize>
		
		<li><a href="yourCart" id="cart-popover" class="btn"
			data-placement="bottom" title="Your Cart"> Your Cart <span
				class="glyphicon glyphicon-shopping-cart"></span></a></li>

		<sec:authorize access="isAuthenticated()">
			<li><a href="<c:url value="j_spring_security_logout" />">Logout</a></li>
		</sec:authorize>

	</ul>

	</nav>
	
<!-- NAVBAR END -->

<!-- YOUR CART BEGINS -->
<h1 align="center">Your Cart</h1>
<div class="container">

<div class="col-sm-12 col-md-10 col-md-offset-1">

	<table id="cart">
    				<thead>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th class="text-center">Price</th>
							
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${cartList}" var="cart">
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="img-thumbnail, col-sm-2 hidden-xs"> <img src="/OrganicFood/myImage/imageDisplay?id=${cart.cartProductId}" 
									alt="Product Image" 
									width="50" height="70">
									</div>
									
									<div class="col-sm-10">
										<h4 class="nomargin"><c:out value="${cart.cartProductName }"/></h4>
									</div>
								</div>
							</td>
									
					<!-- ITEM QUANTITY EDITABLE -->		
							<td data-th="Quantity" class="col-md-1" style="text-align: center">
	                        <input type="text" class="form-control" value="${cart.cartQuantity }" id="exampleInputEmail1">
	                        <c:url var="action" value="saveorupdate/${cart.cartId}"></c:url>
	                        <form:form action="${action}" name="formID" modelAttribute="cart" method="post"> </form:form>
	                        </td>
	                    
					<!-- ITEM PRICE -->
							<td data-th="Price"><strong><c:out value="Rs.${cart.cartPrice }"/></strong></td>
									
					<!-- REMOVE BUTTON START -->
							<td class="col-md-1"> 
								<a href="delete/${cart.cartId}" class="actions" data-th="Delete">
								<button type="button" class="btn btn-danger">
	                            <span class="glyphicon glyphicon-remove"></span> Remove </button></a>
                            </td>
                    <!-- REMOVE BUTTON END -->
						</tr>
						</c:forEach>
						<hr>
						<tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong><c:out value="${cartPrice}"></c:out></strong></h5></td>
                    </tr>
                    
					</tbody>
					<tfoot>
					
						<tr>
							<td><a href="home" class="btn btn-warning"> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							
							<td><a href="checkout" class="btn btn-success btn-block">Checkout</a></td>
						</tr>
					</tfoot>
				</table>
			</div>
			<hr>
<!-- YOUR CART ENDS -->

</body>
</html>

