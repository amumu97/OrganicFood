<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
 <title>Registration</title>  
  <meta charset="utf-8">  
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
  <script src="bootstrap/js/jquery.js"></script>
  <script src="//code.jquery.com/jquery.min.js"></script>
  
  <style> 
  
.nav
{
		padding-right: 10px;
		padding-left: 10px;
	
}

 body
{
    background: url('https://static.pexels.com/photos/109277/pexels-photo-109277.jpeg') black ;
    background-size: cover;
    padding: 0px;
    margin: 0;
}

.wrap
{
    
    height: 100%;
    min-height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 99;
    padding: 60px;
}

p.form-title
{
    font-family: 'Open Sans' , sans-serif;
    font-size: 20px;
    font-weight: 600;
    text-align: center;
    color: 	#696969;
    margin-top: 5%;
    text-transform: uppercase;
    letter-spacing: 4px;
}

form
{
    width: 250px;
    margin: 0 auto;
}

form.login input[type="text"], form.login input[type="password"]
{
    width: 100%;
    margin: 0;
    padding: 5px 10px;   
    background: 0;
    border: 0;
    border-bottom: 1px solid #FFFFFF;
    outline: 0;
    font-style: italic;
    font-size: 12px;
    font-weight: 400;
    letter-spacing: 1px;
    margin-bottom: 5px;
    color: 	#000000;
    outline: 0;
}

form.login input[type="submit"]
{
    width: 100%;
    font-size: 14px;
    text-transform: uppercase;
    font-weight: 500;
    margin-top: 16px;
    outline: 0;
    cursor: pointer;
    letter-spacing: 1px;
}

form.login input[type="submit"]:hover
{
    transition: background-color 0.5s ease;
}

form.login .remember-forgot
{
    float: left;
    width: 100%;
    margin: 10px 0 0 0;
}
form.login .forgot-pass-content
{
    min-height: 20px;
    margin-top: 10px;
    margin-bottom: 10px;
}
form.login label, form.login a
{
    font-size: 12px;
    font-weight: 400;
    color: 	#000000;
}

form.login a
{
    transition: color 0.5s ease;
}

form.login a:hover
{
    color: #2ecc71;
}

.jumbotron 
{
	background-color: rgba(255,255,255,0.75);
	padding-bottom: 80px;
	
}

.pr-wrap
{
    width: 100%;
    height: 100%;
    min-height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 999;
    display: none;
}
  
</style>
  
</head>

<body>

<!-- NAVBAR BEGINS -->

    <nav class="navbar navbar-inverse">
	<div class="container-fluid"></div>

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
		
		<sec:authorize access="!isAuthenticated()">
			<li><a href="register"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
			 authenticated as <sec:authentication property="principal.username" />
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
		<li><a href="yourCart" id="cart-popover" class="btn" data-placement="bottom" title="Your Cart"> Your Cart <span
		class="glyphicon glyphicon-shopping-cart"></span></a></li>
		</sec:authorize>
		
		
		<sec:authorize access="isAuthenticated()">
			<li><a href="<c:url value="j_spring_security_logout" />">Logout</a></li>
		</sec:authorize>

	</ul>

	</nav>
	
<!-- NAVBAR ENDS -->

<!-- REGISTRATION FORM BEGINS -->

<div class="container">
    <div class="row">
        <div class="col-md-12">
           
            <div class="wrap">
            <div class="jumbotron">
                <p class="form-title">Sign Up</p>
                <form:form class="login " action="saveUser" modelAttribute="users">
                <form:input path="name" placeholder="Username"/>
                <form:input path="address" placeholder="Address" />
                <form:input path="email" placeholder="Email" />
                <form:input path="password" type="password" placeholder="Password"/>
                <input type="submit" value="Sign Up" class="btn btn-success btn-sm" />
                <div class="remember-forgot">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label> <input type="checkbox" /> Remember Me </label>
                            </div>
                        </div>
                    </div>
                </div>
                </form:form>
           </div>
            </div>
        </div>
    </div>
</div>

<!-- REGISTRATION FORM ENDS -->

<br><br><br><br><br><br><br><br><br><br><br><br>

</body>

<jsp:include page="footer.jsp"/>
</html>