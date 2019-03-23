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
			<td align="center" colspan="5"><font size="10">낭만캠핑</font></td>
		</tr>
		<tr height="50">
			<td align="center" width="100">텐트</td>
			<td align="center" width="100">의자</td>
			<td align="center" width="100">식기</td>
			<td align="center" width="100">침낭</td>
			<td align="center" width="100">테이블</td>
			<td align="center" width="100">화로</td>
			<td align="center" width="200">
				<%
					if (id == null) {
				%>
				<button
					onclick="location.href='SessionMain.jsp?center=SessionLoginForm.jsp'">로그인</button>
				<%
					} else {
				%> <%=id%>님
				<button onclick="location.href='SessionMain.jsp?logout=1'">로그아웃</button>
				<%
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>