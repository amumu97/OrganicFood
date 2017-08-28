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
<title>HOME</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var showChar = 38;
						var ellipsestext = "...";
						var moretext = "more";
						var lesstext = "less";
						$('.more')
								.each(
										function() {
											var content = $(this).html();

											if (content.length > showChar) {

												var c = content.substr(0,
														showChar);
												var h = content.substr(
														showChar - 1,
														content.length
																- showChar);

												var html = c
														+ '<span class="moreellipses">'
														+ ellipsestext
														+ '&nbsp;</span><span class="morecontent"><span>'
														+ h
														+ '</span>&nbsp;&nbsp;<a href="" class="morelink">'
														+ moretext
														+ '</a></span>';

												$(this).html(html);
											}

										});

						$(".morelink").click(function() {
							if ($(this).hasClass("less")) {
								$(this).removeClass("less");
								$(this).html(moretext);
							} else {
								$(this).addClass("less");
								$(this).html(lesstext);
							}
							$(this).parent().prev().toggle();
							$(this).prev().toggle();
							return false;
						});
					});
</script>

<style>

a.morelink {
	text-decoration: none;
	outline: none;
}

.morecontent span {
	display: none;
}

body {
	background: #FFFFFF;
}

.nav {
	padding-right: 10px;
	padding-left: 10px;
	background: #F5F5F5;
	
}
 
@media screen and (max-width: 768px) {
	.row-offcanvas {
		position: relative;
		-webkit-transition: all 0.25s ease-out;
		-moz-transition: all 0.25s ease-out;
		transition: all 0.25s ease-out;
		background: #F5F5F5;
}

.row-offcanvas-left
.sidebar-offcanvas {
		left: -40%;
}
	
.row-offcanvas-left.active {
		left: 40%;
}
	
.sidebar-offcanvas {
		position: absolute;
		top: 0;
		width: 40%;
		margin-left: 12px;
}
}

#sidebar {
	padding: 15px;
	margin-top: 10px;
}

.item {
	width: 100%;
}

.carousel-inner {
	width: 100%;
	max-height: 400px !important;
}


.product-item {
	padding: 15px;
	background: #fff;
	margin-top: 20px;
	position: relative;
	box-shadow: 5px 5px rgba(234, 234, 234, 0.9);
	
}

	
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

		<sec:authorize access="isAuthenticated()">
			<li><a href="home"><span class="glyphicon glyphicon-user">
						Welcome:<sec:authentication property="principal.username" />
				</span></a></li>
		</sec:authorize>

		<sec:authorize access="!isAuthenticated()">
			<li><a href="register"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<li><a href="yourCart" id="cart-popover" class="btn"
				data-placement="bottom" title="Your Cart"> Your Cart <span
					class="glyphicon glyphicon-shopping-cart"></span></a></li>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<li><a href="<c:url value="j_spring_security_logout" />">Logout</a></li>
		</sec:authorize>

	</ul>

	</nav>

	<!-- SIDE NAVBAR/BODY TEST -->
	
	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-sm-2 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<div class="sidebar-nav">
					<ul class="nav">
						<li class="active"><a href="#">Coupons</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">News</a></li>
					</ul>
				</div>
			</div>
			
			<!-- CAROUSEL -->
	
			<div class="col-sm-9" id="content">
				<div class="container">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">

						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img
									src="https://static.pexels.com/photos/434230/pexels-photo-434230.jpeg"
									alt="Los Angeles" class="img-responsive" style="width: 100%;">
							</div>

							<div class="item">
								<img
									src="https://static.pexels.com/photos/221091/pexels-photo-221091.jpeg"
									alt="Chicago" class="img-responsive" style="width: 100%;">
							</div>

							<div class="item">
								<img
									src="https://static.pexels.com/photos/162686/plums-fruit-jam-violet-162686.jpeg"
									alt="New york" class="img-responsive" style="width: 100%;">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>

				<br>


				<!-- PRODUCT LIST -->

				<div class="container">
					<div class="row">
						<c:forEach items="${Plist}" var="product">
							<div class="col-sm-3">
								<div class="product-item">
									<div class="pi-img-wrapper">
										<img src="/OrganicFood/myImage/imageDisplay?id=${product.id}"
											class="img-responsive" style="width: 180px; height: 250px">
										<div>
											<a href="/OrganicFood/myImage/imageDisplay?id=${product.id}"
												class="btn">View</a>
										</div>
									</div>
									<h3>${product.name }</h3>
									<p class="comment more">${product.description}</p>
									<h5>Rs.${product.price}</h5>

									<a href="addtoCart/${product.id}" class="btn add2cart">Add
										to cart</a>
									<div class="sticker sticker-new"></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
			
			
			
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<!-- NEW CODE END -->

</body>

<jsp:include page="footer.jsp"></jsp:include>

</html>

