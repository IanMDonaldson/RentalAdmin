<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co.</title>
</head>
<body>
<form action="WebFilm?action=updateFilm" method="post">
Title: <input type="text" name="title" value="${title }"/>
Description: <input type="text" name ="description" value="${description}"/>
Release Date: <input type="text" name="releaseDate" value="${releaseDate }"/>
Rental Rate: <input type="text" name="rentalRate" value="${rentalRate }"/>
Replacement Cost: <input type="text" name="replacementCost" value="${replacementCost }"/>
Length: <input type="text" name="length" value="${length}"/>
<input type="submit" value="Update Film"/>
</form>
</body>
</html>
<!-- Form is submitted to the server using the POST method when the user clicks the <input type=...
	then the info will be processed by the code stored in WebFilm
	When using the post method the data is packaged as part of an http request and is not
	visible in the browser. The submission is more secure than the get method, but the 
	resulting page can't be book-marked -->