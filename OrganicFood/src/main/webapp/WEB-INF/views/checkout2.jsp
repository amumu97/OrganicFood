<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONTACT AND BILLING INFORMATION</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
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

	<!-- NAVBAR END -->


	<!-- CHECKOUT PROCESS 2 -->
	<div class='container'>
		<div class='row' style='padding-top: 25px; padding-bottom: 25px;'>
			<div class='col-md-12'>
				<div id='mainContentWrapper'>
					<div class="col-md-8 col-md-offset-2">
						<h2 style="text-align: center;">Contact and Billing
							Information</h2>

						<div class="shopping_cart">
							<form class="form-horizontal" role="form" action="" method="post"
								id="payment-form">
								<div class="panel-group">
									<div class="panel panel-default">
										<div class="panel-body">
											<b>Help us keep your account safe and secure, please
												verify your billing information.</b> <br /> <br />
											<table class="table table-striped" style="font-weight: bold;">
												<tr>
													<td style="width: 175px;"><label for="id_email">Best
															Email:</label></td>
													<td><input class="form-control" id="id_email"
														name="email" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_first_name">First
															name:</label></td>
													<td><input class="form-control" id="id_first_name"
														name="first_name" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_last_name">Last
															name:</label></td>
													<td><input class="form-control" id="id_last_name"
														name="last_name" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label
														for="id_address_line_1">Address:</label></td>
													<td><input class="form-control" id="id_address_line_1"
														name="address_line_1" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label
														for="id_address_line_2">Unit / Suite #:</label></td>
													<td><input class="form-control" id="id_address_line_2"
														name="address_line_2" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_city">City:</label></td>
													<td><input class="form-control" id="id_city"
														name="city" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_state">State:</label></td>
													<td><select class="form-control" id="id_state"
														name="state">
															<option>select a State</option>
															<option value="Out Of Country">International(Outside
																of U.S.)</option>
															<option value="AK">Alaska</option>
															<option value="AL">Alabama</option>
															<option value="AZ">Arizona</option>
															<option value="AR">Arkansas</option>
															<option value="CA">California</option>
															<option value="CO">Colorado</option>
															<option value="CT">Connecticut</option>
															<option value="DE">Delaware</option>
															<option value="FL">Florida</option>
															<option value="GA">Georgia</option>
															<option value="HI">Hawaii</option>
															<option value="ID">Idaho</option>
															<option value="IL">Illinois</option>
															<option value="IN">Indiana</option>
															<option value="IA">Iowa</option>
															<option value="KS">Kansas</option>
															<option value="KY">Kentucky</option>
															<option value="LA">Louisiana</option>
															<option value="ME">Maine</option>
															<option value="MD">Maryland</option>
															<option value="MA">Massachusetts</option>
															<option value="MI">Michigan</option>
															<option value="MN">Minnesota</option>
															<option value="MS">Mississippi</option>
															<option value="MO">Missouri</option>
															<option value="MT">Montana</option>
															<option value="NE">Nebraska</option>
															<option value="NV">Nevada</option>
															<option value="NH">New Hampshire</option>
															<option value="NJ">New Jersey</option>
															<option value="NM">New Mexico</option>
															<option value="NY">New York</option>
															<option value="NC">North Carolina</option>
															<option value="ND">North Dakota</option>
															<option value="OH">Ohio</option>
															<option value="OK">Oklahoma</option>
															<option value="OR">Oregon</option>
															<option value="PA">Pennsylvania</option>
															<option value="RI">Rhode Island</option>
															<option value="SC">South Carolina</option>
															<option value="SD">South Dakota</option>
															<option value="TN">Tennessee</option>
															<option value="TX">Texas</option>
															<option value="UT">Utah</option>
															<option value="VT">Vermont</option>
															<option value="VA">Virginia</option>
															<option value="WA">Washington</option>
															<option value="DC">Washington D.C.</option>
															<option value="WV">West Virginia</option>
															<option value="WI">Wisconsin</option>
															<option value="WY">Wyoming</option>
													</select></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_postalcode">Postalcode:</label></td>
													<td><input class="form-control" id="id_postalcode"
														name="postalcode" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_phone">Phone:</label></td>
													<td><input class="form-control" id="id_phone"
														name="phone" type="text" /></td>
												</tr>

												<tfoot>

													<tr>
														<td><a href="checkout"
															class="btn btn-success"> Go Back</a></td>
														<td colspan="2" class="hidden-xs"></td>

														<td><a href="payment" style="float:left;"
															class="btn btn-success" >Continue</a></td>
													</tr>
												</tfoot>
												</div>
												</div>
												</div>
												</div>
												</form>
												</div>
												</div>
												</div>
												</div>
</body>
</html>