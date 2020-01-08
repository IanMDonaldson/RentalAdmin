<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="MenuBar.jsp" />
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Movie Rental Co.</title>
    <style>
   		<%@include file="css/MenuBar.css" %>
    </style>
    <script><%@ include file="scripts/filmAdd.js"%></script>
  </head>
  <body>
	<h1>Add new Film with ID: <c:out value="${sessionScope.id }"></c:out></h1>
<form action="WebFilm?action=addFilmPOST&id=${sessionScope.id }" method="post" name="myForm">
            <input type="hidden" id="id" name="id" value="${sessionScope.id }" />
            <fieldset>
                <label for="title">Title: </label><input type="text" style="text-transform: uppercase" name="title" id="title" required="required" aria-required="true" pattern="[A-Za-z\ ]+|(\d\d\d\d)+|(\d\d\d)+|(\d\d)+|\d+" /><br>
                <label for="description">Description: </label><input type="text" name="description" id="description" required="required" aria-required="true" /><br>
                <label for="rating">Rating: </label>
                <select>
                    <option value="G">G</option>
                    <option value="PG">PG</option>
                    <option value="PG-13">PG-13</option>
                    <option value="R">R</option>
                    <option value="NC-17">NC-17</option>
                </select><br>
                <label for="language">Language: English</label><br><!-- TODO: implement more languages here when website is complete -->
                <label for="length">Length in Minutes: <abbr title="Required">*</abbr></label><input aria-required="true" type="text" name="length" id="length" class="length" pattern="0*(3\d|1\d\d|20\d|21[0-5])$" required="required" title="Whole number from 30 to 215" /><br>

                <label for="rentalRate">Rental Rate: </label><input aria-required="true" type="text" name="rentalRate" id="rentalRate" pattern="0*(0\.99|[1-4]\.\d\d|[1-4])$" required="required" title="Any whole number or decimal from 0.99 to 4.99" /><br>
                <label for="replacementcost">Replacement Cost: </label><input aria-required="true" type="text" name="replacementCost" id="replacementCost" pattern="0*([5-9]|[1-2]\d|3[0-6]|4\.99|[5-9]\.\d\d|[1-2]\.\d\d|3[0-5]\.\d\d|3[0-5]\.\d|[1-2]\.\d)$" required="required" title="Any whole number or decimal from 4.99 to 36" /><br>
                <label for="rentalDuration">Rental Duration in Days: </label>
                <select>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                </select><br>
                <label for="releaseYear">Release Year: </label><input type="text" aria-required="true" name="releaseYear" id="releaseYear" pattern="0*(18[8-9]\d|19\d\d|20[0-1]\d)$" required="required" title="any year between 1888 and 2019"><br>
                <input type="submit" name="submit" value="Add Film" class="button" />
                <input type="button" onclick="history.back()" value="Cancel" />
    	</fieldset>
  	</form>	
  </body>
</html>