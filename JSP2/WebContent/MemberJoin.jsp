<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<center>
		<form action="MemberJoinProc.jsp" method="post">
			<table width="500" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="150" align="center"><input type="text" name="id"
						size="40"></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">패스워드</td>
					<td width="150" align="center"><input type="password"
						name="pass" size="40"></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">이메일</td>
					<td width="150" align="center"><input type="email"
						name="email" size="40"></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="150" align="center"><input type="tel" name="tel"
						size="40"></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">주소</td>
					<td width="150" align="center"><input type="text"
						name="address" size="40"></td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>