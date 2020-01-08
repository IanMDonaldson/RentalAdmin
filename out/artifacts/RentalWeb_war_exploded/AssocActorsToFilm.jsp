<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@include file="MenuBar.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Movie Rental Co.</title>
	<style>
		<%@include file="css/MenuBar.css"%>
    	<%@include file="css/AssocActorsToFilm.css"%>
    </style>
    <script><%@ include file="scripts/AssocActorsToFilm.js"%></script>
  </head>
  <body>
	<h2>Associate Actors to
	<c:out value="${sessionScope.film.title}">title</c:out></h2>
		<form action="WebFilm?assocActorsPOST&id=${sessionScope.id}" method="post" id="myForm" name="myForm">
            <input type="hidden" id="hiddenActors" name="hiddenActors"/>
			<input type="submit" value="Submit"><br>
			
			<ul>
				<c:forEach items="${sessionScope.actorsAssoc }" var="assoc">
					<li><label><input id="${sessionScope.assoc.id }" type="checkbox" checked="checked" name="A">
						${sessionScope.assoc.lastName }, ${sessionScope.assoc.firstName }</label></li><br>
				</c:forEach>
			</ul>
			<ul>

				<c:forEach items="${sessionScope.actorsNotAssoc }" var="notAssoc">
					<li><label><input id="${sessionScope.notAssoc.id }" type="checkbox">
						${sessionScope.notAssoc.lastName }, ${sessionScope.notAssoc.firstName }</label></li><br>
				</c:forEach>
			</ul>
			
			<input type="submit" value="Submit">
		</form>
  </body>
</html>