<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co.</title>
<link rel="stylesheet" href="css/MenuBar.css"/>


</head>
<body>
<form action="WebActor?action=updateActorPOST&id=${sessionScope. id }" method="post">
	<input type="hidden" name="id" value="${sessionScope. id }"/>
	<fieldset>
		<label for="firstName">First Name: </label><input style="text-transform: uppercase"  type="text" id="firstName" value="${sessionScope.firstName }" pattern="^[A-Za-z]+$"/><br>
		<label for="lastName">Last Name: </label><input style="text-transform: uppercase" type="text" id="lastName"	value="${sessionScope.lastName }" pattern="^[A-Za-z]+$"/><br><br>
		<input type="submit" id="submitbutton" class="button" value="Update Actor"/>
		<input type="button" onclick="history.back()" value="Cancel"/>
	</fieldset>
</form>
</body>
</html>