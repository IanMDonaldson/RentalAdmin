<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="MenuBar.jsp" />
<!doctype html>
<html>
  <head>
    <title>Film Rental Co.</title>
    <link rel="stylesheet" href="css/MenuBar.css"/>


  </head>
  <body>
	<form action="WebCustomer?action=updateCustomerPOST&id=${sessionScope.customer.ID }" method="post">
	<input type="hidden" name="id" value="${sessionScope.customer.ID}"/>
		<fieldset>
			<label for="firstName">First Name: </label><input type="text" id="firstName" value="${sessionScope.customer.firstName }" pattern="^[A-Za-z]+$"/><br>
			<label for="lastName">Last Name: </label><input type="text" id="lastName" value="${sessionScope.customer.lastName}" pattern="^[A-Za-z]+$"/><br>
			<label for="email">Email: </label><input type="email" id="email" value="${sessionScope.customer.email }" pattern="/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/"/><br><br>
			<input type="submit" id="submitbutton" class="button" value="Update Actor"/>
			<input type="button" onclick="back()" value="Cancel"/>
		</fieldset>
	</form>
  </body>
</html>