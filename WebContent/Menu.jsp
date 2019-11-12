<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co.</title>
<style>
<%@include file="/WEB-INF/css/MenuBar.css"%>
</style>
</head>
<body>
	<h1>MENU</h1>
	<ul>
		<li><a href="WebFilm?action=manageFilms">Films</a></li>
		<li><a href="WebActor?action=getAllActors">Actors</a></li>
		<li><a href="WebCustomer?action=getAllCustomers">Customers</a></li>
		<li>Stores</li>
		<li>Staff</li>
	</ul>
</body>
</html>