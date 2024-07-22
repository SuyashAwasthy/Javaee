<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student From Response</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<h1>Student Form Response</h1>
	<div>
		First Name:
		<%=request.getParameter("first-name")%>
		Last Name:
		<%=request.getParameter("last-name")%>
		City:
		<%=request.getParameter("city")%>
		Gender:
		<%=request.getParameter("gender")%>
		Languages:
		<%
		String[] languages = request.getParameterValues("languages");
	if (languages != null) {
		String language = String.join(", ", languages);
		out.println(language);
	} else {
		out.println("None");
	}
	%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>