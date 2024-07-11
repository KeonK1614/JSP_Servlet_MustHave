<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - forwarding</title>
</head>
<body>
	<h3>sendRedirect를 이용한 페이지 이동</h3>
	<%
//		response.sendRedirect("ForwardSub.jsp");
	%>
	
	<h2>액션태그를 이용한 포워딩</h2>
	<%-- <jsp:forward page="/07ActionTag/ForwardSub.jsp"></jsp:forward> --%>
	request.getRequestDispatcher("ForwardSub.jsp");
</body>
</html>