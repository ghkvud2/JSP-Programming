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
	<!-- �Խñ� �ۼ��� �����͸� �о���δ�. -->
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>

	<%
		//�����ͺ��̽��� �� Ŭ������ ����
		BoardDAO boardDAO = new BoardDAO();

		//������ ���� �޼ҵ� ȣ��
		boardDAO.insertBoard(boardBean);
	
		//��ü �Խñ� �������� �̵�
		response.sendRedirect("BoardList.jsp");
	%>

</body>
</html>