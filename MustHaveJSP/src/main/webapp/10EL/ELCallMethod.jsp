<%@ page import="el.MyELClass" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%
	MyELClass myClass = new MyELClass(); //객체생성
	pageContext.setAttribute("myClass", myClass); //page영역에 저장
%>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 메서드 호출</title>
</head>
<body>
	<h3>영역에 저장 후 메서드 호출하기</h3>
	001225-3000000 => ${ myClass.getGender("001225-3000000") }<br/>
	001225-2000000 => ${ myClass.getGender("001225-2000000") }
	
	<h3>클래스명을 통해 정적메서드 호출하기</h3>
	${ MyELClass.showGugudan(7) }
	
	<h3>JSP 코드를 통해 메서드 호출하기</h3>
	<%
		out.println(MyELClass.isNumber("백20") ? "숫자임" : "숫자아님");
		out.println("<br/>");
		
		boolean isNumStr = MyELClass.isNumber("120");
		if (isNumStr == true)
			out.println("숫자입니다.");
		else
			out.println("숫자가 아닙니다.");
	%>
	
	<h3>TLD 파일등록후 정적메서드 호출하기</h3>
	<ul>
		<li>mytag:isNumer("100") => ${ mytag:isNumber("100") }</li>
		<li>mytag:isNumer("100") => ${ mytag:isNumber("이백") }</li>
	</ul>
	
</body>
</html>