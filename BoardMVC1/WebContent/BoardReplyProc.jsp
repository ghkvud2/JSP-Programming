<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
	%>
	<!-- �����͸� �ѹ��� �޾ƿ� �� �ֵ��� useBean �׼��±� ��� -->
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.replyBoard(boardBean);
		response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>