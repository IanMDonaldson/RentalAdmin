<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co.</title>
<style>
	<%@include file="css/MenuBar.css" %>
</style>
</head>
<body>
<form action="WebActor?action=updateActorPOST&id=${sessionScope. id }" method="post">
	<input type="hidden" name="id" value="${sessionScope. id }"/>
	<fieldset>
		<label for="firstName">First Name: </label><input style="text-transform: uppercase"  type="text" name="firstName" value="${sessionScope.firstName }" pattern="^[A-Za-z]+$"/><br>
		<label for="lastName">Last Name: </label><input style="text-transform: uppercase" type="text" name="lastName"	value="${sessionScope.lastName }" pattern="^[A-Za-z]+$"/><br><br>
		<input type="submit" id="submitbutton" class="button" value="Update Actor"/>
		<input type="button" onclick="window.location='http://localhost:8080/RentalWeb/ActorManagement.jsp'" value="Cancel"/>
	</fieldset>
</form>
</body>
</html>