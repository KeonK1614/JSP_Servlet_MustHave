<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%!	//선언부 
	String str1 = "JSP ";
	String str2 = "안녕하세요! ";
%>
<html>
<head>
<meta charset="UTF-8">
<title>HelloJSP</title>
</head>
<body>
	<h2>처음만들어보는 <%= str1 %></h2>
	<p>
		<%
			out.print(str2 + str1 + "입니다. 열공합시다^^");
		%>
	</p>
</body>
</html>