<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Films</title>
<style>
	<%@include file="/WEB-INF/css/MenuBar.css" %>
</style>
</head>
<body>
<h1>List of Films</h1>
<p>
<c:forEach items="${filmList}" var="current">
	<a href="WebFilm?action=getFilm&id=${current.id}">${current.title}</a>
		<div>
			<a href="WebFilm?action=updateFilmGET>&id=${current.id }">Update</a>
			<a href="WebFilm?action=deleteFilmGET&id=${current.id }">Delete</a>
		</div><br>
</c:forEach>
</p>
</body>
</html>