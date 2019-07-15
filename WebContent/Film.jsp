<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Films</title>
</head>
<body>
<p>
Title: ${movie.title}<br>
Description: ${movie.description}<br>
Length: ${movie.length} minutes<br>
Rating: ${movie.rating}<br>
Rental Duration: ${movie.rentalDuration} days<br>
Rental Rate: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${movie.rentalRate}" /><br>
Replacement Cost: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${movie.replacementCost}" /><br><br>
Actors:<br>
<c:forEach items="${actors}" var="actor">
	${actor.firstName} ${actor.lastName}<br>
</c:forEach>
</p>

<a href="Movie">Return to Movies</a><br>
<a href="Home">Return to Main Menu</a>
</body>
</html>