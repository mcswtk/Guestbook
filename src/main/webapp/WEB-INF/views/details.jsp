<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details</title>
<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.6/css/bootstrap.min.css"/>"/>
</head>
<body>
	<div style="width:60vw; margin: 0 auto;">
		<h1 align="center">Note: <c:out value="${note.id}" /></h1>
			<c:if test="${note!=null}">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>Author</th>
							<th>Title</th>
							<th>Passion</th>
							<th>Date</th>
							<th>Comment</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:out value="${note.id}" /></td>
							<td><c:out value="${note.author}" /></td>
							<td><c:out value="${note.title}" /></td>
							<td><c:out value="${note.passion}" /></td>
							<td><c:out value="${note.date}" /></td>
							<td><c:out value="${note.comment}" /></td>
						</tr>
					</tbody>
				</table>
			</c:if>
		<hr>
		<center>
		<a href="<c:url value="/All"/>" class="btn btn-default">Back</a>
		<a href="<c:url value="/"/>" class="btn btn-default">Home</a>
		</center>
	</div>
	<script src="<c:url value="/webjars/jquery/1.9.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"/>"></script>
</body>
</html>