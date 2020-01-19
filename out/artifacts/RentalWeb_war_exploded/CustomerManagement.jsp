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
<form action="WebCustomer?action=searchCustomerPOST" method="post">
<label for="search">Search: </label><input type="text" id="search" name="search"/>
<input type="submit" value="Search Customers" /><br><br>
<a href="WebCustomer?action=getAllCustomers">List All Customers</a>
</form>
</body>
</html>