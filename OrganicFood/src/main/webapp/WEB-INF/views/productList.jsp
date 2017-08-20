<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	  <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <title>Product List</title>
</head>
<body>

<jsp:include page="index.jsp"></jsp:include>

	<div class="container">
		<c:forEach items="${Plist}" var="product">
			<h2 style="color: red"> <c:out value="${product.name }" /> </h2>

			<div class="col-xs-6 w3-animate-left">
				<div class="img">
					<img height="200" width="200px" alt="${product.pId}"
						src="<c:url value="/resources/images/${product.pId}.jpg"></c:url>">
					
				 	<img src="/OrganicFood/image/imageDisplay?id=${product.pId}"> 
					
				 <div class="desc"> </div>
				</div>
			</div>

			<div class="col-xs-4 ">
				<div class="img">
					<div class="desc">
						<p>
						
						<div class="form-group">
							<input type="text" class="form-control" value="${product.name}" readonly="readonly">
						</div>

						<div class="form-group">
							<input type="text" class="form-control" value="Rs. ${product.price}" readonly="readonly">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" value="${product.description}" readonly="readonly">
						</div>
						<div>
						<form action="../addtoCart/${userid}/${product.pId}">
								<input type="submit" value="Add to Cart" class="btn btn-primary">

							</form>
 
						</div></div></div></div></c:forEach>
						</div>
<!-- 
					</div>
				</div>
			</div>
		
 -->	

</body>

<jsp:include page="footer.jsp"></jsp:include>

</html>



 --%>