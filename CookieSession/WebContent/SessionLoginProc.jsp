<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<h2 align="center">���� �α��� ó�� 1</h2>
	<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		session.setMaxInactiveInterval(60 * 2);

		response.sendRedirect("SessionMain.jsp");
	%>

	<h2 align="center">
		����� ���̵��
		<%=id%>�Դϴ�.
	</h2>
	<a href="SessionLoginProc2.jsp">���� �������� �̵�</a>
</body>
</html>