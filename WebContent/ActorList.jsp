<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Actors!</title>
<style>
<%@include file="/WEB-INF/css/MenuBar.css" %>
</style>
</head>
<body>
	<h1>List of Actors</h1>
	<c:forEach items="${ActorList}" var="current">
		<a href="WebActor?action=getActor&id=${current.id}">${current.lastName},
			${current.firstName}</a>
		<br>
	</c:forEach>
</body>
</html>