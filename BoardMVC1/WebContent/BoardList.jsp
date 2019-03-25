<%@page import="model.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		//��ü �Խñ��� ����� JSP�� �ҷ��;���
		BoardDAO boardDAO = new BoardDAO();
		List<BoardBean> list = boardDAO.getAllBoard();
	%>

	<h2 align="center">��ü �� ����</h2>
	<table align="center" width="800" border="1">
		<tr height="40">
			<td width="50" align="center">��ȣ</td>
			<td width="350" align="center">����</td>
			<td width="150" align="center">�ۼ���</td>
			<td width="150" align="center">�ۼ���</td>
			<td width="100" align="center">��ȸ��</td>
		</tr>
		<%
			for (BoardBean boardBean : list) {
		%>
		<tr height="40">
			<!-- �� ��ȣ�� �Խ��� ī���͸� �����ϸ鼭 ���� �����մϴ�.  -->
			<td width="50" align="center">���߿� ����</td>
			<td width="350" align="left"><a
				href="BoardInfo.jsp?num=<%=boardBean.getNum()%>"><%=boardBean.getSubject()%></td>
			<td width="150" align="center"><%=boardBean.getWriter()%></td>
			<td width="150" align="center"><%=boardBean.getReg_date()%></td>
			<td width="100" align="center"><%=boardBean.getReadcount()%></td>
		</tr>
		<%
			}
		%>
		<tr height="40">
			<td align="center" colspan="5">
			<button onclick="location.href='BoardWriteForm.jsp'">�� ����</button>
			</td>
		</tr>
	</table>
</body>
</html>