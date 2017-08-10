<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	 
	<jsp:include page="navbar.jsp"/>
	
	<form:form method="POST" action="saveUser" modelAttribute="users" >
			<div> 
			<table>
			
				<tr>
					<td><form:label path="email">Email</form:label></td>
					<td><form:input path="email"/></td>
				</tr>
				
				<tr>
					<td><form:label path="password">Password</form:label></td>
					<td><form:input path="password"/></td>
				</tr>
				<tr>
					<td><input type="submit" value="Submit"/></td>
				</tr>
				
			</table>
			</div>
	</form:form>
	 
</body>
	
	<jsp:include page="footer.jsp"/> 
	
</html>

