<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ taglib prefix ="c" uri="http://java.sun/com/jsp/jstl/core" %> --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body>
<jsp:include page="navbar.jsp"/>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Spring MVC Form Handling</title>
 </head>
 <body><center>
  <h2>Create New Category</h2>
  <form:form method="POST" action="/elhumeante/saveCategory.html">
      <table>
       <tr>
           <td><form:label path="categoryId">Category ID:</form:label></td>
           <td><form:input path="categoryId" readonly="true"/></td>
       </tr>
       <tr>
           <td><form:label path="categoryName">Category Name:</form:label></td>
           <td><form:input path="categoryName" value="${category.categoryName}"/></td>
       </tr>
       
       <tr>
       <tr>
        <td>&nbsp;</td>
         <td><input type="submit" value="SAVE"/></td>
         </tr>
   </table> 
  </form:form>
  <br/>
  <c:if test="${!empty categories}">
 <table align="center" border="1">
  <tr>
   <th>Category ID</th>
   <th>Category Name</th>
   <th>Options</th>
  </tr>

  <c:forEach items="${categories}" var="category">
   <tr>
    <td><c:out value="${category.categoryId}"/></td>
    <td><c:out value="${category.categoryName}"/></td>
    <td align="center"><a href="editCategory.html?categoryId=${category.categoryId}">Edit</a> | <a href="deleteCategory.html?categoryId=${category.categoryId}">Delete</a></td>
   </tr>
  </c:forEach>
 </table>
</c:if>
<h2><a href="addPublication.html">Adding Publication</a></h2>
</center>
 


</body>
<jsp:include page="footer.jsp"/>
</html>