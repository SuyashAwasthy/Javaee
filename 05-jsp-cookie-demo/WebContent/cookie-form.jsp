<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Select favorite programming language</p>
<form action="cookie-response.jsp" method="get">
	<select name="favLanguage">
	<option value="Java">Java</option> 
	<option value="C++">C++</option>
	<option value="Python">Python</option> 
	</select>
	<input type="submit" value="Submit"/>
</form>

</body>
</html>