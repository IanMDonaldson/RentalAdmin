<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="/WEB-INF/MenuBar.jsp" />
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Movie Rental Co.</title>
    <style>
    	<%@include file="/WEB-INF/css/MenuBar.css"%>
    	<%@include file="/WEB-INF/css/AssocActorsToFilm.css"%>
    </style>
    <script src="/WEB-INF/scripts/AssocActorsToFilm.js" defer></script>
  </head>
  <body>
	<h2>Associate Actors to <c:out value="${film.title}"></c:out></h2>
		<form action="WebFilm?assocActorsPOST" method="post" id="actors">
			<input type="submit" value="Submit"><br>
			
			<ul>
				<c:forEach items="${alreadyAssociated }" var="associated">
					<li><label><input id="actor${associated.id }" type="checkbox" checked="checked">
						${associated.lastName }, ${associated.firstName }</label></li><br>
				</c:forEach>
				<c:forEach items="${actors }" var="actor">
					<li><label><input id="actor${actor.id }" type="checkbox" checked="unchecked">
						${actor.lastName }, ${actor.firstName }</label></li><br>
				</c:forEach>
			</ul>
			
			<input type="submit" value="Submit">
		</form>
  </body>
</html>