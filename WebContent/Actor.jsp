<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Actors!</title>
<style>
<%@include file="/WEB-INF/css/MenuBar.css" %>
</style>
</head>
<body>
	<p>
		First Name: ${actor.firstName}<br> 
		Last Name: ${actor.lastName }<br>
		Actor's ID: ${actor.id }<br>
		Films played by Actor:<br><br>
		<c:forEach items="${ActorFilmList}" var="actor">
			${actor.title}<br>
		</c:forEach>
	</p>
<a href="WebActor?action=getAllActors">Return to Actor List</a>
<a href="Home">Return to Main Menu</a>
</body>
</html>