<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new Note</title>
<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap/3.3.6/css/bootstrap.min.css"/>" />
</head>
<body>
	<div style="width:60vw; margin: 0 auto; text-align:center;">
	<h1>Add new note</h1>
	<br>
		<form:form action="" modelAttribute="form" method="POST" class="form-horizontal">
			<div class="form-group">
				<label for="inputAuthor" class="col-sm-2 control-label">Author</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="author" id="inputAuthor">
					<font color="red"><form:errors path="author" /></font>
				</div>
			</div>
			<div class="form-group">
				<label for="inputTitle" class="col-sm-2 control-label">Title</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title" id="inputTitle">
					<font color="red"><form:errors path="title" /></font>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassion" class="col-sm-2 control-label">Passion</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="passion" id="inputPassion">
				</div>
			</div>
			<div class="form-group">
				<label for="inputComment" class="col-sm-2 control-label">Comment</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="comment"></textarea>
					<font color="red"><form:errors path="comment" /></font>
				</div>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form:form>
	</div>
	<hr>
			<center><a href="<c:url value="/"/>" class="btn btn-default">Home</a></center>
	<script src="<c:url value="/webjars/jquery/1.9.1/jquery.min.js"/>"></script>
	<script	src="<c:url value="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"/>"></script>
</body>
</html>