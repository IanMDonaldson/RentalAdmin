<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ include file="MenuBar.jsp"%>
<!doctype html>
<%--todo: stop user from removing every actor OR mess with the logic in delActorsfromfilm to allow removing all actors from film--%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Film Rental Co.</title>
	<link rel="stylesheet" href="css/MenuBar.css"/>
    <link rel="stylesheet" href="css/AssocActorsToFilm.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="application/javascript" src="scripts/AssocActorsToFilm.js" defer></script>
  </head>
  <body>
	<h2>Associate Actors to ${sessionScope.film.title}</h2>
		<form action="WebFilm?action=assocActorsPOST&id=${sessionScope.film.id}" method="post" id="myForm" name="myForm">
			<input type="submit" id="submitButton" value="Submit"><br>
			<input type="hidden" id="hiddenActors" name="hiddenActors" />
			<ul class="prevAssoc">
				<c:forEach items="${sessionScope.actorsAssoc }" var="assoc">
					<li><label><input id="${assoc.id }" type="checkbox" checked="checked" class="act">
						${assoc.lastName }, ${assoc.firstName }</label></li><br>
				</c:forEach>
			</ul>
			<ul class="prevUnassoc">

				<c:forEach items="${sessionScope.actorsNotAssoc }" var="notAssoc">
					<li><label><input id="${notAssoc.id }" type="checkbox" class="act">
						${notAssoc.lastName }, ${notAssoc.firstName }</label></li><br>
				</c:forEach>
			</ul>
			
			<input type="submit" value="Submit" id = "submitButton2">
		</form>
  </body>
</html>