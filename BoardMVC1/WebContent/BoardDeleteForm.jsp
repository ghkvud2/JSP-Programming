<%@page import="model.BoardBean"%>
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
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO boardDAO = new BoardDAO();
	BoardBean boardBean = boardDAO.getOneBoard(num);
	boardBean.setReadcount(boardBean.getReadcount() - 1);
%>
<h1 align="center">�� �����ϱ�</h1>

	<form action="BoardDeleteProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<table align="center" width="600" border="1" bordercolor="gray">

			<tr height="40">
				<td align="center" width="120">�ۼ���</td>
				<td align="center" width="180"><%=boardBean.getWriter()%></td>
				<td align="center" width="120">�ۼ���</td>
				<td align="center" width="180"><%=boardBean.getReg_date()%></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">����</td>
				<td align="center" colspan="3">&nbsp;<%=boardBean.getSubject()%></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">��й�ȣ</td>
				<td align="center" colspan="3">&nbsp; <input type="password" name="password" size="65"></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">�� ����</td>
				<td colspan="3" width="480">&nbsp;
				<textarea rows="12" cols="70"
						name="content" align="" readonly="readonly"><%=boardBean.getContent()%></textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="4" size="55">
				<input type="submit" value="����"> &nbsp; &nbsp; 
				<!-- ������ form �±׾ȿ� button�±׸� ����ϸ� 
				������ submit�� �Ǵ� ��찡 �ִµ� �׶� type="button"�� �߰����ָ� �ȴ�.-->
				<button onclick="location.href='BoardList.jsp'">��ü �ۺ���</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>