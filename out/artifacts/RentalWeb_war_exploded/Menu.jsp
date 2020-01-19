<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co.</title>
    <link rel="stylesheet" href="css/MenuBar.css"/>
    <script type="application/javascript" src="scripts/nothing.js"></script>
</head>
<body>
	<h1>MENU</h1>
	<ul>
		<li><a href="WebFilm?action=manageFilms">Manage Films</a></li>
		<li><a href="WebActor?action=manageActors">Manage Actors</a></li>
		<li><a href="WebCustomer?action=manageCustomers">List Customers</a></li>
		<li>Stores</li>
		<li>Staff</li>
	</ul>
</body>
</html>