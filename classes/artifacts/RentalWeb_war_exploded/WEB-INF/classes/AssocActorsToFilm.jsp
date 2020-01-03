<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@include file="WEB-INF/MenuBar.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Movie Rental Co.</title>
	<style>
		<%@include file="WEB-INF/css/MenuBar.css"%>
    	<%@include file="WEB-INF/css/AssocActorsToFilm.css"%>
    </style>
    <script type="text/javascript" src="<c:url value="WebContent/WEB-INF/scripts/AssocActorsToFilm.js"/>"></script>
  </head>
  <body>
	<h2>Associate Actors to
	<c:out value="${film.title}">title</c:out></h2>
		<form action="WebFilm?assocActorsPOST&id=${id}" method="post" id="myForm" name="myForm">
            <input type="hidden" id="hiddenActors" name="hiddenActors"/>
			<input type="submit" value="Submit"><br>
			
			<ul>
				<c:forEach items="${actorsAssoc }" var="assoc">
					<li><label><input id="${assoc.id }" type="checkbox" checked="checked" name="A">
						${assoc.lastName }, ${assoc.firstName }</label></li><br>
				</c:forEach>
			</ul>
			<ul>

				<c:forEach items="${actorsNotAssoc }" var="notAssoc">
					<li><label><input id="${notAssoc.id }" type="checkbox">
						${notAssoc.lastName }, ${notAssoc.firstName }</label></li><br>
				</c:forEach>
			</ul>
			
			<input type="submit" value="Submit">
		</form>
  </body>
</html>