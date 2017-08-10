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
							  <form:form method="POST"  modelAttribute="category" action="saveCategory"> 
							        <table>
									       <tr>
									           <td><form:label path="name">Category Name:</form:label></td>
									           <td><form:input path="name" /></td>
									       </tr>
									       
									       <tr>
									           <td><form:label path="description">Category Description:</form:label></td>
									           <td><form:input path="description"/></td>
									       </tr>
									       
									       <tr>
										       <td>&nbsp;</td> 	
										       <td><input type="submit" value="SAVE"/></td>
									       </tr>
							   		</table> 
							  </form:form>
						  
						  <br/>
						  
							  <c:if test="${!empty categoryList}">
								  <table align="center" border="1">
									  <tr>
										   <th>Category ID</th>
										   <th>Category Name</th>
										   <th>Category Description</th>
										   <th>Options</th>
									  </tr>
									
									  <c:forEach items="${categoryList}" var="category">
									  <tr>
											<td><c:out value="${category.catId}"/></td>
											<td><c:out value="${category.name}"/></td>
											<td><c:out value="${category.description}"/></td>
									  </tr>
									  </c:forEach>
								 </table>
							</c:if>
							
						</center> 
		
</body>

<jsp:include page="footer.jsp"/>

</html>