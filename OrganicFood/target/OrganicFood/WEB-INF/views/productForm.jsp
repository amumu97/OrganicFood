<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="navbar.jsp"/>
        <center>
        
        <form:form method="POST" action="saveProduct" modelAttribute="product">
             <table>
	                <tr>
			                    <td><form:label path="name">Product Name</form:label></td>
			                    <td><form:input path="name"/></td>
	                </tr>
            
				    <tr>
			                    <td><form:label path="price">Product Price</form:label></td>
			                    <td><form:input path="price"/></td>
	                </tr>
	                
          			<tr>
			                    <td><form:label path="description">Product Description</form:label></td>
			                    <td><form:input path="description"/></td>
		            </tr>
		            
		            <tr>
			                    <td><form:label path="stock">Product Stock</form:label></td>
			                    <td><form:input path="stock"/></td>
		            </tr>
		            
          			<tr>
								<td><form:label class="btn btn-default btn-block" path="supplier_id">Select a Supplier</form:label></td>
								<td><form:select path="supplier_id" class="form-control" required="true">
										<c:forEach items="${supplierList}" var="supplier">
											<form:option class="form-control" value="${supplier.sId}">${supplier.supplierName}</form:option>
										</c:forEach>
									</form:select></td>
					</tr>
					
					<tr>
								<td><form:label class="btn btn-default btn-block" path="category_id">Select a Category</form:label></td>
								<td><form:select class="form-control" path="category_id" required="true">
										<c:forEach items="${categoryList}" var="category">
											<form:option class="form-control" value="${category.catId}">${category.name}</form:option>
										</c:forEach>
									</form:select></td>
					</tr>
					
     				<tr>
  						<td><input type="submit" value="Submit"/></td>
                	</tr>
            </table>
       </form:form>
	</center>

</body>

<jsp:include page="footer.jsp"/>

</html>