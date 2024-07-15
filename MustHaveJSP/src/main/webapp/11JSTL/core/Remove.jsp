<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:set var="scopeVar" value="Page Value" /><!-- 영역이 선언x 가장 좁은 영역에 생: page -->
<c:set var="scopeVar" value="Request Value" scope="request" />
<c:set var="scopeVar" value="Session Value" scope="session" />
<c:set var="scopeVar" value="Applicaiton Value" scope="application" />
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - remove</title>
</head>
<body>
	<h4>출력하기</h4>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>reqestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
	
	<h4>session 영역에서 삭제하기</h4>
	<c:remove var="scopeVar" scope="session" />
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>reqestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
	
	<h4>scope 지정 없이 삭제하기</h4>
	<c:remove var="scopeVar"/>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>reqestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
</body>
</html>