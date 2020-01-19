<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co. - Film Management</title>
<link rel="stylesheet" href="css/MenuBar.css"/>


</head>
<body>
<h1>Films</h1>
<form action="WebFilm?action=searchFilmPOST" method="post">
    <label for="title">Search: <input type="text" id="title" name="title"/></label>
<input type="submit" value="Search Films" /><br>
<a href="WebFilm?action=getAllFilms">List all Films</a>
<a href="WebFilm?action=addFilmGET">Add Film</a>
</form>
</body>
</html>