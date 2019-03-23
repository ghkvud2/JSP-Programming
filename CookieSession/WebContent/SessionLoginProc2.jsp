<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<body>
	<h2 align="center">세션 로그인 처리 2</h2>
	<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("id");
		String pass = (String)session.getAttribute("pass");
	%>

	<h2 align="center">
		당신의 아이디는
		<%=id%>입니다.
	</h2>
</body>
</html>