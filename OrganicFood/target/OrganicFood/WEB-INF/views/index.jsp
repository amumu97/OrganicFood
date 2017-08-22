<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>

body {
	background: #f1f1f1;
}

.product-item {
	padding: 15px;
	background: #fff;
	margin-top: 20px;
	position: relative;
}

.product-item:hover {
	box-shadow: 5px 5px rgba(234, 234, 234, 0.9);
}

.product-item:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
	font-size: 0;
	line-height: 0;
}

.sticker {
	position: absolute;
	top: 0;
	left: 0;
	width: 63px;
	height: 63px;
}

.sticker-new {
	background: url(http://keenthemes.com/assets/bootsnipp/new.png)
		no-repeat;
	left: auto;
	right: 0;
}

.pi-img-wrapper {
	position: relative;
}

.pi-img-wrapper div {
	background: rgba(0, 0, 0, 0.3);
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	width: 100%;
	height: 100%;
	text-align: center;
}

.product-item:hover>.pi-img-wrapper>div {
	display: block;
}

.pi-img-wrapper div .btn {
	padding: 3px 10px;
	color: #fff;
	border: 1px #fff solid;
	margin: -13px 5px 0;
	background: transparent;
	text-transform: uppercase;
	position: relative;
	top: 50%;
	line-height: 1.4;
	font-size: 12px;
}

.product-item .btn:hover {
	background: #e84d1c;
	border-color: #c8c8c8;
}

.product-item h3 {
	font-size: 14px;
	font-weight: 300;
	padding-bottom: 4px;
	text-transform: uppercase;
}

.product-item h3 a {
	color: #3e4d5c;
}

.product-item h3 a:hover {
	color: #E02222;
}

.pi-price {
	color: #e84d1c;
	font-size: 18px;
	float: left;
	padding-top: 1px;
}

.product-item .add2cart {
	float: right;
	color: #a8aeb3;
	border: 1px #ededed solid;
	padding: 3px 6px;
	text-transform: uppercase;
}

.product-item .add2cart:hover {
	color: #fff;
	background: #e84d1c;
	border-color: #e84d1c;
}
</style>
</head>
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
			 authenticated as <sec:authentication property="principal.username" />
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

<!-- NEW CODE START -->
<div class="container">
<c:forEach items="${Plist}" var="product">
    <div class="row">
        <div class="col-md-3">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="/OrganicFood/myImage/imageDisplay?id=${product.id}" 
                class="img-responsive" 
                alt="Quinoa Rice" 
                style="width: 150px; height: 250px">
                <div>
                  <a href="#" class="btn">View</a>
                </div>
              </div>
              <h3><c:out value="${product.name }" /></h3>
              <!-- <div class="pi-price">$29.00</div> -->
              <div class="form-group">
							<input type="text" class="form-control"
								value="${product.description}" readonly="readonly">
			  </div>
              <div class="form-group">
				<input type="text" class="form-control"
					   value="Rs.${product.price}" readonly="readonly">
			  </div>
              <a href="addtoCart/${product.id}" class="btn add2cart">Add to cart</a>
              <div class="sticker sticker-new"></div>
            </div>
        </div>
    </div>
</c:forEach>
</div>
<br>
<br>

<!-- NEW CODE END -->

<!-- PRODUCT LISTING START -->
	<%-- <div class="container">
		<c:forEach items="${Plist}" var="product">
			<h2 style="color: red">
				<c:out value="${product.name }" />
			</h2>

			<div class="col-xs-6 w3-animate-left">
				<div class="img">
					<img alt="" class="thumbnail"
						src="/OrganicFood/myImage/imageDisplay?id=${product.id}"
						style="width: 100px; height: 100px">

					<div class="desc"></div>
				</div>
			</div>

			<div class="col-xs-4 ">
				<div class="img">
					<div class="desc">
						<p>
						<div class="form-group">
							<input type="text" class="form-control" value="${product.name}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<input type="text" class="form-control"
								value="Rs.${product.price}" readonly="readonly">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								value="${product.description}" readonly="readonly">
						</div>
						<div>

							<a href="addtoCart/${product.id}" class="btn btn-primary">Add
								to Cart</a>

						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
 --%>
<!-- PRODUCT LISTING END -->

</body>

<jsp:include page="footer.jsp"></jsp:include>

</html>

