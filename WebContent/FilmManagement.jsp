<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - Film Management</title>
<style>
	<%@include file="/WEB-INF/css/MenuBar.css" %>
</style>
</head>
<body>
<h1>Films</h1>
<form action="WebFilm?action=searchFilmPOST" method="post">
Search: <input type="text" name="title"/>
<input type="submit" value="Search Films" /><br>
<a href="WebFilm?action=getAllFilms">List all Films</a>
</form>
</body>
</html>