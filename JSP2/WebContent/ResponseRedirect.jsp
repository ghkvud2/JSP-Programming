<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>ResponseRedirect jsp 페이지입니다.</h2>

	<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
	%>
	<h3>
		아이디 :
		<%=id%></h3>
	<h3>
		비밀번호 :
		<%=pass%></h3>
</body>
</html>