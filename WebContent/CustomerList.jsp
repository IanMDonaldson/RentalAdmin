<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co. - List of Customers</title>
<style>
	<%@include file="/WEB-INF/css/MenuBar.css" %>
</style>
</head>
<body>
<h1>Customer List</h1>
<p>
	<c:forEach items="${CustomerList}" var="current">
		<a href="WebCustomer?action=getCustomer&id=${current.ID}">${current.lastName}, ${current.firstName}</a>
		<br>
	</c:forEach>
</p>
</body>
</html>