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
	//BoardInfo.jsp���� [�亯 ����] ��ư�� ������ �� �Ѿ���� �����͸� �޴´�.
	int num =Integer.parseInt(request.getParameter("num"));
	int ref =Integer.parseInt(request.getParameter("ref"));
	int re_step =Integer.parseInt(request.getParameter("re_step"));
	int re_level =Integer.parseInt(request.getParameter("re_level"));
%>


<h1 align="center">�亯�� ����</h1>

	<form action="BoardReWriteProc.jsp" method="post">
	<!-- ����ڷκ��� �����͸� �Է¹��� �ʰ� BoarReWriteProc.jsp�� ������. -->
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="ref" value="<%=ref %>">
	<input type="hidden" name="re_step" value="<%=re_step %>">
	<input type="hidden" name="re_level" value="<%=re_level %>">
		
		<table align="center" width="600" border="1" bordercolor="gray">
			<tr height="40">
				<td align="center" width="150" >�ۼ���</td>
				<td width="450"><input type="text" name="writer" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">����</td>
				<td width="450"><input type="text" name="subject" value ="��[�亯] "size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">�̸���</td>
				<td width="450"><input type="email" name="email" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">��й�ȣ</td>
				<td width="450"><input type="password" name="password" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">�� ����</td>
				<td width="450"><textarea rows="15" cols="60" name="content" size="60"></textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="2" size="55">
				<input type="submit" value="Ȯ��"> &nbsp; &nbsp; 
				<input type="reset" value="�����"> &nbsp; &nbsp;
				<button onclick="location.href='BoardList.jsp'">��ü �ۺ���</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>