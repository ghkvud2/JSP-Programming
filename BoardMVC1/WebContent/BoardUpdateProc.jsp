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
	<!-- BoardUpdateForm.jsp���� �Ѿ���� ���� �޴´�. -->
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO boardDAO = new BoardDAO();

		//�켱 �ش� �Խñ��� ��й�ȣ�� ��ġ�ϴ��� Ȯ���Ѵ�.
		String inputPassword = boardBean.getPassword();
		String dbPassword = boardDAO.getOneBoard(boardBean.getNum()).getPassword();
		
		//��й�ȣ�� ��ġ�ϸ� ������ ������ DB�� �ݿ��Ѵ�.
		if (inputPassword.equals(dbPassword)) {
			boardDAO.updateBoard(boardBean);
			response.sendRedirect("BoardList.jsp");
		} else {
	%>
			<!-- �н����尡 ��ġ���� ������ ���� �������� �̵� -->
			<script type="text/javascript">
				alert("�н����尡 ��ġ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
	<%
		}
	%>

	%>
</body>
</html>