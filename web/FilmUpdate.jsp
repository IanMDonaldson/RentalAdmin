<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co.</title>
Film

	<link rel="stylesheet" href="css/FilmUpdateForm.css"/>

</head>
<body>
<form action="WebFilm?action=updateFilmPOST&id=${sessionScope.id }" method="post">
	<input type="hidden" name="id" value="${sessionScope.id }"/>
	<fieldset>
		 
		 <label for="title">Title:</label><input type="text" id="title" value="${sessionScope.title }" pattern="^[^0-9]+$"/><br>
	 
	 
		 <label for="description">Description:</label> 
		 	<input type="text" id="description" value="${sessionScope.description}" pattern="^[^0-9]+$"/><br>
	 
	 
		 <label for="rentalRate">Rental Rate:</label> 
		 	<input type="text" id="rentalRate" value="${sessionScope.rentalRate }" pattern="^\d*(\.\d{0,2})?$"/> <br>
	 
	 
		 <label for="replacementCost">Replacement Cost:</label> 
		 	<input type="text" id="replacementCost" value="${sessionScope.replacementCost }" pattern="^\d*(\.\d{0,2})?$"/><br>
	 
	 
		 <label for="length">Length:</label> 
		 	<input type="text" id="length" value="${sessionScope.length}" pattern="^\d*(\.\d{0,2})?$"/><br><br>
	 
	 
		 <input type="submit" id="submitbutton" class="button" value="Update Film"/>
		 <a href="WebFilm?action=getFilm&id=${sessionScope.id }" class="button">Cancel</a>
		 
	</fieldset>
</form>
</body>
</html>