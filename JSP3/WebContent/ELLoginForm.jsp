<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">로그인</h2>
	<form action="ELLogionProc.jsp" method="post">
		<table align="center" width="400" border="1">
			<tr height="50">
				<td width="150">아이디</td>
				<td width="250"><input type="text" name="id"></td>
			</tr>
			<tr height="50">
				<td width="150">비밀번호</td>
				<td width="250"><input type="password" name="password"></td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>