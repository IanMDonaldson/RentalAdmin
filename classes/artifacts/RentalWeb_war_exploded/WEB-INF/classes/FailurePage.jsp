<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
<c:choose>
	<c:when test="${add }">
		<h2>Add failed!</h2><br>
		<a href="Home">Click Here to return to Main Menu</a>
	</c:when>
	<c:when test="${update }">
		<h2>Update Failed!</h2><br><br>
		<a href="Home">Click Here to return to Main Menu</a>
	</c:when>
	<c:when test="${delete }">
		<h2>Deletion Failed!</h2><br><br>
		<a href="Home">Click Here to return to Main Menu</a>
	</c:when>
	<c:when test="${noActorsToDelete}">
		<h2>There are no removable Actors!</h2>
		<a href="Home">Click Here to return to Main Menu</a>
	</c:when>
</c:choose>

</body>
</html>