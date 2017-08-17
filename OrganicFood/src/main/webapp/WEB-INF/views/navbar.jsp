<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>navbar</title>
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
      <li><a href="#">Shop by: Category</a></li>  
      
    </ul>
    
      <form class="navbar-form navbar-left">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
      </form>
	    <ul class="nav navbar-nav navbar-right">
	   <c:if test="${pageContext.request.userPrincipal.name!=null }">
	   <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
	   <li><a href=" <c:url value="/logout"/>" > Logout </a></li>
	   </c:if>
	   
	    </ul>
    
  </div>
</nav>

</body>
</html>