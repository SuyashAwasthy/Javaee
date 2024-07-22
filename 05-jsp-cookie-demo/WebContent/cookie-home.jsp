<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String favLanguage = "Java";
		Cookie[] cookies = request.getCookies();
	
		if(cookies!=null){
			for(Cookie c:cookies){
				if(c.getName().equals("favoriteLang")){
					favLanguage = c.getValue();
					break;
				}
			}
		}
	%>
	
	<h2>Your favorite language is <%=favLanguage %></h2>
	<a href="cookie-form.jsp">Change your favorite language.</a>
</body>
</html>