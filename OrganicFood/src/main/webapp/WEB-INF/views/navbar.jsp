<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>navbar</title>
	<style>
	
	.nav{
		padding-right: 10px;
		padding-left: 10px;
	}
	
	
	
	</style>
</head>

<body>


<nav class="navbar navbar-inverse">  
  <div class="container-fluid">  
    
    <div class="navbar-header">  
      <a class="navbar-brand" href="#">The Warehouse</a>
   	</div>
    
    <ul class="nav navbar-nav">
    
    
      <li class="addingCat"><a href="category">Category</a></li>
      <li class="addingSupp"><a href="supplier">Supplier</a></li>
      <li class="addingProd"><a href="product">Product</a></li>
      <sec:authorize access="isAuthenticated()">
		<li><a href="home"><span class="glyphicon glyphicon-user"> Welcome:<sec:authentication property="principal.username"/></span></a></li>
	  </sec:authorize>

       <sec:authorize access="isAuthenticated()">
       <li> <a href="<c:url value="j_spring_security_logout" />">Logout</a></li>
       </sec:authorize>
       
      
    </ul>
    
      <form class="navbar-form navbar-left">
      <div class="form-group">
        <!-- <input type="text" class="form-control" placeholder="Search"> -->
      </div>
     <!--  <button type="submit" class="btn btn-default">Submit</button> -->
      </form>
	    <ul class="nav navbar-nav navbar-right"> </ul>
    
  </div>
</nav>

</body>
</html>