<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>Session Test</h2>
	<%
		String name = "Lee";
		session.setAttribute("name", name);
		session.setMaxInactiveInterval(10);
	%>
	<a href="SessionName.jsp">SessiongName 페이지로 이동</a>
</body>
</html>