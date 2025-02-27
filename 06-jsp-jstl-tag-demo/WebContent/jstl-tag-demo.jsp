<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="name" value="Suyash"></c:set>
	<h1>Welcome ${name}</h1><br>
	
	<c:choose>
		<c:when test="${name.length()>5}">
			Your name length is greater than 5.
		</c:when>
		<c:when test="${name.length()>3}">
			Your name length is greater than 3.
		</c:when>
		
		<c:otherwise>
			Your name length is less than 3.
		</c:otherwise>
	</c:choose>
	
	<c:if test="${name.length() >= 5}">
		<h2>Name ${name} has length greater than or equal to 5</h2>
	</c:if>
	
	<c:if test="${name.length() < 5}">
		<h2>Name ${name} has length less than 5</h2>
	</c:if>
</body>
</html>