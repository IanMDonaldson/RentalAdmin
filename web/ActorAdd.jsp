<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="MenuBar.jsp" />
<!doctype html>
<html lang="en">
  <head>
    <title>Movie Rental Co.</title>
    <style>
    	<%@include file="css/MenuBar.css" %>
    </style>
    <script><%@ include file="scripts/validateActorAdd.js"%></script>
  </head>
  <body>
  	<h1>Add new Actor with ID: <c:out value="${sessionScope.id }"></c:out></h1>
  	<form action="WebActor?action=addActorPOST&id=${sessionScope.id }" method="post" name="myForm">
  		<input type="hidden" id="id" name="id" value="${sessionScope.id }"/>
		<fieldset>
			<label for="firstName">First Name: </label><input type="text" style="text-transform: uppercase" name="firstName" id="firstName" pattern="[A-Za-z]*"/><br>
			<label for="lastName">Last Name: </label><input type="text" style="text-transform: uppercase" name="lastName" id="lastName" pattern="[A-Za-z]*"/><br>
			<input type="submit" name="submit" onclick="validateActorAdd()" value="Add Actor"/>
			<input type="button" onclick="window.location='ActorManagement.jsp'" value="Cancel"/>
		</fieldset>
	</form>
  </body>
</html>