<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - out</title>
</head>
<body>
	<c:set var="iTag">
		i 태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	<h4>기본 사용</h4>
	<c:out value="${ iTag }" />
	
	<!-- 이너html효과가 나옴 -->
	<h4>escapeXml 속성</h4>
	<c:out value="${ iTag }" escapeXml="false" />
	
	<h4>default 속성</h4>
	<c:out value="${ param.name }" default="이름없음" />
	<c:out value="" default="빈 문자열도 값입니다." />
</body>
</html>