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
	<%@include file="css/ActorList.css" %>
</style>
</head>
<body>
	<a href="WebActor?action=addActorGET" class="button">Add Actor</a>
	<h1>List of Actors</h1>
	<c:forEach items="${sessionScope.actorList}" var="current">
		<a href="WebActor?action=getActor&id=${current.id}">${current.lastName}, ${current.firstName}</a>
		<a href="WebActor?action=deleteActorGET" class="button" id="delete">Delete</a>
		<a href="WebActor?action=updateActorGET" class="button" id="delete">Update</a>
		<br>
	</c:forEach>
</body>
</html>