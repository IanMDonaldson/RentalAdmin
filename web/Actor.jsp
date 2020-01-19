<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co. - List of Actors!</title>
<link rel="stylesheet" href="css/MenuBar.css"/>

<link rel="stylesheet" href="css/Actor.css"/>

</head>
<body>
<a href="javascript:history.back()" class="button">Return to Actor List</a>
<a href="WebActor?action=updateActorGET&id=${sessionScope.id }" class="button">Update Actor</a>
<a href="WebActor?action=deleteActorGET&id=${sessionScope.id }" class="button">Delete Actor</a><br><br>
	<div class="types">First Name: </div><div class="data">${sessionScope.firstName }</div><br>
	<div class="types">Last Name: </div><div class="data">${sessionScope.lastName }</div><br>
	<div class="types">Actor's ID: </div><div class="data">${sessionScope.id }</div><br>
	<div class="types">Films Played by Actor: </div>
		<div class="list">
			<c:forEach items="${sessionScope.actorsFilmList}" var="film">
				<a href="WebFilm?action=getFilm&id=${film.id}">${film.title }</a><br>
			</c:forEach>
		</div>
	
</body>
</html>