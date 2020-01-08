<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rental Co.</title>
<style>
	<%@include file="css/MenuBar.css" %>
</style>
</head>
<body>
<form action="WebCustomer?action=searchCustomerPOST" method="post">
Search: <input type="text" name="customerName"/>
<input type="submit" value="Search Customers" /><br><br>
<a href="WebCustomer?action=getAllCustomers">List All Customers</a>
</form>
</body>
</html>