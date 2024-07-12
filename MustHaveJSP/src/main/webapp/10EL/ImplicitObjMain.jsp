<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("scopeValue", "페이지 영역");
	request.setAttribute("scopeValue", "리퀘스트 영역");
	session.setAttribute("scopeValue", "세션 영역");
	application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>ImplicitObjMain 페이지</h2>
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<li>페이지 영역 : ${ pageScope.scopeValue }</li>
		<li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
		<li>세션 영역 : ${ sessionScope.scopeValue }</li>
		<li>어플리케이션 영역 : ${ applicationScope.scopeValue }</li>
	</ul>
	
	<h3>각 영역에 저장된 속성을 jsp의 내장 객체를 통해 읽기</h3>
	<ul>
		<li>페이지 영역 : <%= pageContext.getAttribute("scopeValue") %></li>
		<li>리퀘스트 영역 : <%= request.getAttribute("scopeValue") %></li>
		<li>세션 영역 : <%= session.getAttribute("scopeValue") %></li>
		<li>어플리케이션 영역 : <%= application.getAttribute("scopeValue") %></li>
	</ul>
	
	<h3>영역지정 없이 속성읽기</h3>
	<ul>
		<li>${ scopeValue }</li>
	</ul>
	
	<jsp:forward page="ImplicitForwardResult.jsp" />
</body>
</html>