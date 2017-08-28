<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style> 

.nav{
		padding-right: 10px;
		padding-left: 10px;
	
}
  body
{
    background: url('https://static.pexels.com/photos/566566/pexels-photo-566566.jpeg') grey ;
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

<!-- LOGIN FORM BEGINS -->


<div class="container">
    <div class="row">
        <div class="col-md-12">
           
            <div class="wrap">
            <div class="jumbotron">
                <p class="form-title">Log In</p>
                
                <form class="login" method="post" action="j_spring_security_check">
                <input type="text" id="inputEmail" name="j_username" class="login_box" placeholder="Email" />
			    <input type="password" id="inputPassword" name="j_password" class="login_box" placeholder="Password" />
				<input type="submit" value="Log In" class="btn btn-success btn-sm" />
                <div class="remember-forgot">
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label> <input type="checkbox" /> Remember Me </label>
                            </div>
                        </div>
                    </div>
                    
                </div>
                
                </form>
           </div>
            </div>
        </div>
    </div>
</div>
	
<!-- LOGIN FORM ENDS -->


	<%-- 
	<div class="card card-container">
		<h2 class='login_title text-center'>Login</h2>
		<hr>
		<form method="post" action="j_spring_security_check">
		
			<h4 class="input-title">Email</h4>
			<input type="text" id="inputEmail" name="j_username" class="login_box" placeholder="Enter your email address" />
			
			<h4 class="input-title">Password</h4>
			<input type="password" id="inputPassword" name="j_password" class="login_box" placeholder="Enter your password" />
			
			<div id="remember" class="checkbox"></div>
			<button class="btn btn-lg btn-primary" type="submit">Login</button>
			
		</form>
	</div>  --%>
	 
</body>
<jsp:include page="footer.jsp"/>
</html>