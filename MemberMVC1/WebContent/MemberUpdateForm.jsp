<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
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
		String id = request.getParameter("id");
		MemberDAO memberDAO = new MemberDAO();
		MemberBean member = memberDAO.selectMember(id);
	%>
	<h2 align="center">ȸ������ �����ϱ�</h2>

	<table align="center" width="400" border="1">
		<form action="MemberUpdateProc.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>">
			<tr height="50">
				<td align="center" width="150">���̵�</td>
				<td width="250"><%=member.getId()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">�̸���</td>
				<td width="250"><input type="email" name="email"
					value="<%=member.getEmail()%>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">��ȭ��ȣ</td>
				<td width="250"><input type="tel" name="tel"
					value="<%=member.getTel()%>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">��й�ȣ</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>

			<tr height="50">
				<td align="center" colspan="2"><input type="submit"
					value="ȸ������ ����">&nbsp;&nbsp;
		</form>
		<button onclick="location.href='MemberList.jsp'">ȸ�� ��ü����</button>
		</td>
		</tr>
	</table>

</body>
</html>