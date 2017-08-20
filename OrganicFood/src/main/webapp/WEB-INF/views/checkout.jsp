<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Checkout</title>
</head>
<body>

<jsp:include page="index.jsp"></jsp:include>

<div class="container">
<div class="row">
<div class="col-xs-6 jumbotron">
<div class="head">
<h3><p class="mytext">Customer Details</p></h3>
</div>
<div class="outer">
<div class="well" style="width:100%">
<form action="${pageContext.request.contextPath}/index" method="post"></form>
<c:set var="srk2" value="0"></c:set>
<c:forEach var="c" items="${cart}">
<c:set var="srk2" value="${srk2 + cart.cartPrice*cart.cartQuantity}"></c:set>
</c:forEach>
</div>
<div class="well">
<table class="tbdetail">
<tr>
<td colspan="3"><b>Name</b></td>
<td>${users.name}</td>
</tr>

<tr> 
<td colspan="3"><b>Email</b></td>
<td>${users.email}</td>
</tr>

<tr>
<td colspan="3"><b>Address</b></td>
<td>${users.address}</td>
</tr>
</table>
</div>

</div>
</div>
</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>