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
<form action="WebActor?action=searchActorPOST" method="post">
Search: <input type="text" name="actorName"/>
<input type="submit" value="Search Actors" /><br><br>
<a href="WebActor?action=getAllActors">List all Actors</a>
<a href="WebActor?action=addActorGET">Add Actor</a>
<a href="WebActor?action=deleteActorGET">Delete Actor</a>
</form>
</body>
</html>