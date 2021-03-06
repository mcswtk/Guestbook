<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of authors</title>
<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.6/css/bootstrap.min.css"/>"/>
</head>
<body>
	<c:choose>
		<c:when test="${errorMsg!=null}">
			<p class="bg-danger">
			<c:out value="${errorMsg}"></c:out>
			</p>
		</c:when>
		<c:otherwise><p class="bg-info">${message}</p></c:otherwise>
	</c:choose>
	<c:remove var="message" scope="session" />

	<div style="width:15vw; margin: 0 auto;">
			<c:if test="${fn:length(notes)>0}">
				<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Author</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${notes}" var="current" varStatus="count">
						<tr>
							<td>
								<c:out value="${count.count}"/>
							</td>
							<td>
								<c:out value="${current.author}" />
							</td>
						</tr>
					</c:forEach>
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