<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Films</title>
<style>
	<%@include file="/WEB-INF/css/MenuBar.css" %>
</style>
</head>
<body>
<p>
<h1>${film.title}</h1><br>
<a href="WebFilm?action=updateFilmGET&id=${film.id}">Update Movie</a>
<p>
	Description: ${film.description}<br>
	Length: ${film.length} minutes<br>
	Rating: ${film.rating}<br>
	Rental Duration: ${film.rentalDuration} days<br>
	Rental Rate: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${film.rentalRate}" /><br>
	Replacement Cost: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${film.replacementCost}" /><br><br>
	Actors:<br>
	<c:forEach items="${actors}" var="actor">
		${actor.firstName} ${actor.lastName}<br>
	</c:forEach>
</p>
<a href="WebFilm?action=getAllFilms">Return to Movies</a><br>
<a href="Home">Return to Main Menu</a>
</body>
</html>