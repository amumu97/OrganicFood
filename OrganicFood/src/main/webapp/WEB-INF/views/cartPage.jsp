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

<body>

<h1 align="center">Your Cart</h1>
${emptycart}
<div class="container">
	<table id="cart">
    				<thead>
						<tr>
							<th>Product</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Update</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${cartList}" var="cart">
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin"><c:out value="${cart.cartProductName }"/></h4>
									</div>
								</div>
							</td>
							<td data-th="Price"><c:out value="${cart.cartPrice }"/></td>
							<td data-th="Quantity"><c:out value="${cart.cartQuantity }"/></td>
							<td data-th="Quantity"><c:out value=""/>
								<c:url var="action" value="saveorupdate/${cart.cartId}"></c:url>
		                        <form:form action="${action}" name="formID" modelAttribute="cart" method="post"> </form:form>
							</td>
							<td class="actions" data-th="Delete"> <a href="delete/${cart.cartId}">
							<button class="btn btn-danger btn-sm"></button></a>								
							</td>
						</tr>
						
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center">Total</td>
						</tr>
						<tr>
							<td><a href="/" class="btn btn-warning"> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center">Total:<c:out value="${cartPrice}"></c:out></td>
							<td><a href="/checkout" class="btn btn-success btn-block">Checkout</a></td>
						</tr>
					</tfoot>
				</table>
</div>
</body>
</html>