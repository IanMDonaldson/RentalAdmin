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
	<%@include file="/WEB-INF/css/FilmUpdateForm.css" %>
</style>
</head>
<body>
<form action="WebFilm?action=updateFilm&id=${id }" method="post">
	<input type="hidden" name="id" value="${id }"/>
	<fieldset>
		 
		 <p><label for="title">Title:</label><input type="text" name="title" value="${title }"/></p>
	 
	 
		 <p><label for="description">Description:</label> 
		 	<input type="text" name ="description" value="${description}"/></p>
	 
	 
		 <p><label for="rentalRate">Rental Rate:</label> 
		 	<input type="text" name="rentalRate" value="${rentalRate }"/></p> 
	 
	 
		 <p><label for="replacementCost">Replacement Cost:</label> 
		 	<input type="text" name="replacementCost" value="${replacementCost }"/></p> 
	 
	 
		 <p><label for="length">Length:</label> 
		 	<input type="text" name="length" value="${length}"/></p><br> 
	 
	 
		 <input type="submit" id="submitbutton" class="button" value="Update Film"/> 
		 <button class="button">Cancel</button> 
		 
	</fieldset>
</form>
</body>
</html>