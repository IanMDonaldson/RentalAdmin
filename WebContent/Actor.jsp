<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Actors!</title>
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
</body>
</html>