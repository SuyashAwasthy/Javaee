<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Hello World</h1>

<!--  Expression Tag -->
Today's date is <%= new java.util.Date() %> <br>
Sum of 10 and 20 is <%= 10+20 %> <br>
Is 10 greater than 20 <%= 10>20 %> <br>
String in caps <%= new String("Hello World").toUpperCase() %> <br>

<!-- Scriplet Tag -->
<%
	for(int i=1;i<=10;i++){
		out.println("<h4>Number "+i+"</h4>");
	}
%>

<!-- Declaration Tag -->
<%!
	String convertToUppercase(String str){
		return str.toUpperCase();
	}

%>
<%!
	String firstLetterOfEachWordToUppercase(String str){
		String[] arr = str.split(" ");
    	StringBuffer string = new StringBuffer();
    	for (int i = 0; i < arr.length; i++) {
        	string.append(Character.toUpperCase(arr[i].charAt(0))).append(arr[i].substring(1)).append(" ");
    	}          
    	return string.toString().trim(); 
	}
%>
<%=
	convertToUppercase("India is my country.")
%>
<%=
	firstLetterOfEachWordToUppercase("india is my country.")
%>


</body>
</html>