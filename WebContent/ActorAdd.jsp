<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="/WEB-INF/MenuBar.jsp" />
<!doctype html>
<html lang="en">
  <head>
    <title>Movie Rental Co.</title>
    <style>
    	<%@include file="/WEB-INF/css/MenuBar.css" %>
    </style>
    <script src="/WEB-INF/scripts/validateActorAdd.js"></script>
  </head>
  <body>
  	<h1>Add new Actor with ID: <c:out value="${id }"></c:out></h1>
  	<form action="WebActor?action=addActorPOST&id=${id }" method="post" name="myForm">
  		<input type="hidden" id="id" name="id" value="${id }"/>
		<fieldset>
			<label for="firstName">First Name: </label><input type="text" name="firstName" id="firstName" pattern="^[A-Z]{1}[a-z]+$"/><br>
			<label for="lastName">Last Name: </label><input type="text" name="lastName" id="lastName" pattern="^[A-Z]{1}[a-z]+$"/><br>
			<input type="submit" name="submit" onclick="validateActorAdd" value="Add Actor"/>
			<input type="button" onclick="window.location='http://localhost:8080/RentalWeb/ActorManagement.jsp'" value="Cancel"/>
		</fieldset>
	</form>
  </body>
</html>