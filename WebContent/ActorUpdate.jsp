<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co.</title>
<style>
	<%@include file="/WEB-INF/css/MenuBar.css" %>
</style>
</head>
<body>
<form action="WebActor?action=updateActorPOST&id=${ id }" method="post">
	<input type="hidden" name="id" value="${ id }"/>
	<fieldset>
		<label for="firstName">First Name: </label><input type="text" name="firstName" value="${firstName }" pattern="^[A-Za-z]+$"/><br>
		<label for="lastName">Last Name: </label><input type="text" name="lastName"	value="${lastName }" pattern="^[A-Za-z]+$"/><br><br>
		<input type="submit" id="submitbutton" class="button" value="Update Actor"/>
		<input type="button" onclick="WebActor?action=getActor&id=${id}" value="Cancel"/>
	</fieldset>
</form>
</body>
</html>