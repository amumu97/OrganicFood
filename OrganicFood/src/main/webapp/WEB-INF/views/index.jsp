<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">  
<head> 
	<script src="//code.jquery.com/jquery.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
  
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
  <title>Bootstrap Case</title>  
  <meta charset="utf-8">  
  <meta name="viewport" content="width=device-width, initial-scale=1">   -->
  
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
    
</head>  

<body>  

<nav class="navbar navbar-inverse">  
  <div class="container-fluid"> </div>  
    
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
      <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
   </sec:authorize>
   
   <sec:authorize access="isAuthenticated()">
   <li><a href="<c:url value="j_spring_security_logout" />">Logout</a>
</sec:authorize>
   
    </ul>
    
</nav>

 					<c:forEach items="${PList}" var="product">
									  <tr>
											<td><c:out value="${product.pId}"/></td>
											<td><c:out value="${product.name}"/></td>
																				  </tr>
									  </c:forEach>
</body> 

<jsp:include page="footer.jsp"></jsp:include>
 
</html>  

${error}

