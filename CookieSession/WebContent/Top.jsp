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
		String logout = request.getParameter("logout");
		if (logout != null){
			session.setAttribute("id", null);
			session.setMaxInactiveInterval(0);
		}

		String id = (String) session.getAttribute("id");
	%>

	<table align="center" width="800" border="1">
		<tr height="100">
			<td align="center" colspan="2" width="200"><img
				src="image/logo.PNG" width="200" height="70"></td>
			<td align="center" colspan="5"><font size="10">����ķ��</font></td>
		</tr>
		<tr height="50">
			<td align="center" width="100">��Ʈ</td>
			<td align="center" width="100">����</td>
			<td align="center" width="100">�ı�</td>
			<td align="center" width="100">ħ��</td>
			<td align="center" width="100">���̺�</td>
			<td align="center" width="100">ȭ��</td>
			<td align="center" width="200">
				<%
					if (id == null) {
				%>
				<button
					onclick="location.href='SessionMain.jsp?center=SessionLoginForm.jsp'">�α���</button>
				<%
					} else {
				%> <%=id%>��
				<button onclick="location.href='SessionMain.jsp?logout=1'">�α׾ƿ�</button>
				<%
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>