<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co. - List of Films</title>
<link rel="stylesheet" href="css/MenuBar.css"/>


</head>
<body>
<p>
<a href="WebFilm?action=getAllFilms">Return to Films</a><br>
<h1>${sessionScope.film.title}</h1><br>
<a href="WebFilm?action=updateFilmGET&id=${sessionScope.film.id}" class="button">Update Film</a>
<a href="WebFilm?action=updateFilmGET&id=${sessionScope.film.id }" class="button">Update</a>
<a href="WebFilm?action=deleteFilmGET&id=${sessionScope.film.id }" class="button">Delete</a>
<a href="WebFilm?action=assocActorsGET&id=${sessionScope.film.id}" class="button">Associate Actors</a>
<p>
	Description: ${sessionScope.film.description}<br>
	Length: $<fmt:formatNumber type="number" maxFractionDigits="0" value="${sessionScope.film.length}" /> minutes<br>
	Rental Duration: $<fmt:formatNumber type="number" maxFractionDigits="0" value="${sessionScope.film.rentalDuration}"/> days<br>
	Rental Rate: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${sessionScope.film.rentalRate}" /><br>
	Replacement Cost: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${sessionScope.film.replacementCost}" /><br><br>
	Actors:<br>
	<c:forEach items="${sessionScope.filmsActorList}" var="actor">
		<a href="WebActor?action=getActor&id=${actor.id}">${actor.firstName}, ${actor.lastName}</a><br>
	</c:forEach>
</p>
</body>
</html>