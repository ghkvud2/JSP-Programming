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
		String id = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("id")) {
					id = cookie.getValue();
					break;
				}
			}
		}
	%>
	<h2 align="center">쿠키 로그인</h2>
	<form action="CookieLoginProc.jsp" method="post">
		<table align="center" width="400" border="1">
			<tr height="50">
				<td width="150">아이디</td>
				<%if(id != null){ %>
				<td width="250"><input type="text" name="id" value="<%=id%>"></td>
				<%}else{%>
					<td width="250"><input type="text" name="id" ></td>
				<% }%>
			</tr>
			<tr height="50">
				<td width="150">비밀번호</td>
				<td width="250"><input type="password" name="pass"></td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center"><input type="checkbox"
					name="save" value="1"> &nbsp; 아이디 저장하기</td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>