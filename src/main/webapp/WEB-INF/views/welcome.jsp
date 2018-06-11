<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GuestBook</title>
<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.6/css/bootstrap.min.css"/>" />
</head>
<body>
<div class="container">
	<div class="jumbotron">
	<h1>Hello!</h1>
	<h3>Welcome to Guestbook</h3>
		<a href="newNote">New guest.</a> 
		<br> 
		<br> 
		<a href="All">View all guests.</a>
	</div>
</div>
	<script src="<c:url value="/webjars/jquery/1.9.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"/>"></script>
</body>
</html>