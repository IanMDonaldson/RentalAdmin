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
    	<%@ include file="/WEB-INF/css/MenuBar.css" %>
    	<%@include file="/WEB-INF/css/ActorDelete.css" %>
    </style>
  </head>
  <body>
  		<form action="WebActor?action=deleteActorPOST" method="POST">
   			 <select name="removableActors" id="removableActors" onchange="this.form.submit()">
       		 	<c:forEach items="${removableActors }" var="current">
	    			<option value="${current.id }">
	    				ID ${current.id}, ${current.firstName } ${current.lastName}
    				</option>
	    		</c:forEach>
    		</select>
    		<input type="submit" id="submit" class="button" value="Delete Actor"/>
		</form>
  </body>
</html>