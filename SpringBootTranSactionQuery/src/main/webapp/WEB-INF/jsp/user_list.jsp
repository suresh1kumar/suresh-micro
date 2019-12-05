<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2>Article List</h2>
  <table class="table table-striped">
   <thead>
	   <tr>
		    <th scope="row">#ID</th>
		    <th scope="row">Title</th>
		    <th scope="row">Category</th>
		    <th scope="row">Update</th>
		    <th scope="row">Delete</th>
	    </tr>
   </thead>
   <tbody>
    
    <c:forEach items="${articleList }" var="article" >
     <tr>
      <td>${article.id }</td>
      <td>${article.title }</td>
      <td>${article.category }</td>
      <td>
       <spring:url value="/article/updateArticle/${article.id }" var="updateURL" />
       <a class="btn btn-primary" href="${updateURL }" role="button" >Update</a>
      </td>
      <td>
       <spring:url value="/article/deleteArticle/${article.id }" var="deleteURL" />
       <a class="btn btn-primary" href="${deleteURL }" role="button" >Delete</a>
      </td>
     </tr>
    </c:forEach>
   </tbody>
  </table>
  <spring:url value="/article/addArticle/" var="addURL" />
  <a class="btn btn-primary" href="${addURL }" role="button" >Add New Article</a>
 </div>
</body>
</html>