<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<h2 align="center">세션 로그인 처리 1</h2>
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
		당신의 아이디는
		<%=id%>입니다.
	</h2>
	<a href="SessionLoginProc2.jsp">다음 페이지로 이동</a>
</body>
</html>