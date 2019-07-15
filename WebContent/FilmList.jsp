<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Films</title>
</head>
<body>
<h1>List of Films</h1>d
<p>
<c:forEach items="${FilmList}" var="current">
	<a href="Film?action=getFilm&id=${current.id }">${current.title }</a><br>
</c:forEach>
</p>
</body>
</html>