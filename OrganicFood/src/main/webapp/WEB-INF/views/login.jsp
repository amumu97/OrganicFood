<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Welcome to Login Page </title>
</head>
<body>
	 <%-- 
	<jsp:include page="index.jsp"/> --%>
	
	
	
			<div class="card card-container"> 
				<h2 class='login_title text-center'> Login </h2>
					<hr>
					<form method ="post" action = "j_spring_security_check">
						<h4 class="input-title"> Email </h4> 
					 	<input type ="text" id="inputEmail" name="j_username" class="login_box" placeholder="Enter your email address"/>
					 	<h4 class="input-title"> Password </h4>
					 	<input type="password" id="inputPassword" name="j_password" class="login_box" placeholder="Enter your password"/> 
					 	<div id="remember" class="checkbox"></div>
					 	<button class="btn btn-lg btn-primary" type="submit"> Login </button>
					</form>
					
					
			</div>
</body>	
</html>