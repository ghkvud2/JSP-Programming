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
	<table align="center" width="400" border="1">
		<tr height="50">
			<td align="center" width="150">���̵�</td>
			<td width="250"><%=member.getId()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">�̸���</td>
			<td width="250"><%=member.getEmail()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">��ȭ��ȣ</td>
			<td width="250"><%=member.getTel()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">���</td>
			<td width="250"><%=member.getHobby()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">����</td>
			<td width="250"><%=member.getJob()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">����</td>
			<td width="250"><%=member.getAge()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">����</td>
			<td width="250"><%=member.getInfo()%></td>
		</tr>
		<tr height="50">
			<td colspan="2" align="center">
				<button onclick="location.href='MemberUpdateForm.jsp?id=<%=id%>'">ȸ�� ����</button> &nbsp; &nbsp;
				<button onclick="location.href='MemberDeleteForm.jsp?id=<%=id%>'">ȸ�� ����</button> &nbsp; &nbsp;
				<button onclick="location.href='MemberList.jsp'">��� ����</button> &nbsp; &nbsp;
				<button onclick="location.href='MemberJoin.jsp'">ȸ�� ����</button> &nbsp; &nbsp;
			</td>
		</tr>
	</table>
</body>
</html>