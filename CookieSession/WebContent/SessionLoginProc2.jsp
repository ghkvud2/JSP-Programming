<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<body>
	<h2 align="center">���� �α��� ó�� 2</h2>
	<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("id");
		String pass = (String)session.getAttribute("pass");
	%>

	<h2 align="center">
		����� ���̵��
		<%=id%>�Դϴ�.
	</h2>
</body>
</html>