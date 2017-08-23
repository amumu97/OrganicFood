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
<title>PAYMENT</title>
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

	<!-- CHECKOUT PROCESS 3 -->

	<div class='container'>
		<div class='row' style='padding-top: 25px; padding-bottom: 25px;'>
			<div class='col-md-12'>
				<div id='mainContentWrapper'>
					<div class="col-md-8 col-md-offset-2">
						<h2 style="text-align: center;">Payment Information</h2>

						<div class="shopping_cart">
							<form class="form-horizontal" role="form" action="" method="post"
								id="payment-form">
								<div class="panel-group">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title" style="text-align: center;">
												<b>Please enter your details carefully</b>
											</h4>
										</div>

										<div class="panel-body">
											<span class='payment-errors'></span>
											<fieldset>
												<legend>What method would you like to pay with
													today?</legend>
												<div class="form-group">
													<label class="col-sm-3 control-label"
														for="card-holder-name">Name on Card</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" stripe-data="name"
															id="name-on-card" placeholder="Card Holder's Name">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="card-number">Card
														Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control"
															stripe-data="number" id="card-number"
															placeholder="Debit/Credit Card Number"> <br />
														<div>
															<img class="pull-right"
																src="https://s3.amazonaws.com/hiresnetwork/imgs/cc.png"
																style="max-width: 250px; padding-bottom: 20px;">
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="expiry-month">Expiration
															Date</label>
														<div class="col-sm-9">
															<div class="row">
																<div class="col-xs-3">
																	<select class="form-control col-sm-2"
																		data-stripe="exp-month" id="card-exp-month"
																		style="margin-left: 5px;">
																		<option>Month</option>
																		<option value="01">Jan (01)</option>
																		<option value="02">Feb (02)</option>
																		<option value="03">Mar (03)</option>
																		<option value="04">Apr (04)</option>
																		<option value="05">May (05)</option>
																		<option value="06">June (06)</option>
																		<option value="07">July (07)</option>
																		<option value="08">Aug (08)</option>
																		<option value="09">Sep (09)</option>
																		<option value="10">Oct (10)</option>
																		<option value="11">Nov (11)</option>
																		<option value="12">Dec (12)</option>
																	</select>
																</div>
																<div class="col-xs-3">
																	<select class="form-control" data-stripe="exp-year"
																		id="card-exp-year">
																		<option value="2016">2016</option>
																		<option value="2017">2017</option>
																		<option value="2018">2018</option>
																		<option value="2019">2019</option>
																		<option value="2020">2020</option>
																		<option value="2021">2021</option>
																		<option value="2022">2022</option>
																		<option value="2023">2023</option>
																		<option value="2024">2024</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="cvv">Card
															CVC</label>
														<div class="col-sm-3">
															<input type="text" class="form-control" stripe-data="cvc"
																id="card-cvc" placeholder="Security Code">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-offset-3 col-sm-9"></div>
													</div>
											</fieldset>
											
											<input type="checkbox" name="vehicle" value="Bike"> By submitting this order you are agreeing to our <a
														href="/legal/billing/">universal billing agreement</a>, and
													<a href="/legal/terms/">terms of service</a>. If you have
													any questions about our products or services please contact
													us before placing this order.<br>	
											<br>
											<tfoot>
												<tr>
													<td><a href="billing" class="btn btn-success" > Go
															Back</a></td>
													<td colspan="2" class="hidden-xs"></td>

													<td><a href="fini" class="btn btn-warning">Pay Now!</a></td>
												</tr>
											</tfoot>
										</div>
							</form>
						</div>
					</div>
				</div>
			</div>
</body>
</html>