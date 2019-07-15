<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Actors!</title>
</head>
<body>
	<h1>List of Actors</h1>
	<c:forEach items="${ActorList}" var="current">
		<a href="Actor?action=getActor&id=${current.id}">${current.firstName},
			${current.lastName}</a>
		<br>
	</c:forEach>
</body>
</html>