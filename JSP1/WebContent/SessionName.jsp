<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>SessionName 페이지입니다.</h2>
	<%
		String name = (String)session.getAttribute("name");
	%>
	<h3><%=name %>님 반갑습니다.</h3>
</body>
</html>