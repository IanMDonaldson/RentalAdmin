<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="WebFilm?action=updateFilm&id=${id }" method="post">
<input type="hidden" name="id" value="${id }"/>
<label for="title">Title:</label><input type="text" name="title" value="${title }"/><br>
<label for="description">Description:</label> <input type="text" name ="description" value="${description}"/><br>
<label for="rentalRate">Rental Rate:</label>  <input type="text" name="rentalRate" value="${rentalRate }"/><br>
<label for="replacementCost">Replacement Cost:</label> <input type="text" name="replacementCost" value="${replacementCost }"/><br>
<label for="length">Length:</label> <input type="text" name="length" value="${length}"/><br><br>

<!-- Category: <input type="text" name="length" value="${category}"/><br> TODO change the update SQL-->
<!--Language: <input type="text" name="language" value="${language}"/><br> to take these changes-->
<input type="submit" id="button" value="Update Film"/>
</form>
</body>
</html>