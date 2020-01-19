<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co.</title>
<link rel="stylesheet" href="css/MenuBar.css"/>


</head>
<body>
<form action="WebActor?action=searchActorPOST" method="post">
<label for="actorName">Search: </label>
    <input type="text" id="actorName" name="actorName"/>
    <input type="submit" value="Search Actors" /><br><br>
<a href="WebActor?action=getAllActors">List all Actors</a>
<a href="WebActor?action=addActorGET">Add Actor</a>
</form>
</body>
</html>