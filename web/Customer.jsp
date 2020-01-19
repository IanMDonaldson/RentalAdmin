<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <jsp:include page="MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Rental Co. - Customer List</title>
<link rel="stylesheet" href="css/MenuBar.css"/>


</head>
<body>
<p>
Customer: ${sessionScope.customer.firstName} ${sessionScope.customer.lastName} <br>
ID: ${sessionScope.customer.ID} <br>
Email: ${sessionScope.customer.email} <br>
Address ID: ${sessionScope.customer.addressID}<br>
Store ID: ${sessionScope.customer.storeID} <br>
Last Update: $<fmt:formatDate pattern="MM/dd/yyyy" value="${sessionScope.customer.lastUpdate}"/><br>
Customer Creation Date: $<fmt:formatDate pattern="MM/dd/yyyy" value="${sessionScope.customer.createDate}"/><br>
</p>
<a href="WebCustomer?action=getAllCustomers">Return to Customer List</a>
<a href="Home?action=mainMenu">Return to Main Menu</a>
</body>
</html>