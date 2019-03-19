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
		<table width="800" border="1">
			<tr height="100">
				<td align="center" colspan="2" width="260"><img
					src="image/logo.PNG" width="200" height="70"></td>

				<td align="center" colspan="5"><font size="10">낭만캠핑</font></td>
			</tr>
			<tr height="50">
				<td align="center" width="110">텐트</td>
				<td align="center" width="110">의자</td>
				<td align="center" width="110">식기</td>
				<td align="center" width="110">침낭</td>
				<td align="center" width="110">테이블</td>
				<td align="center" width="110">화로</td>
				<td align="center" width="140"><%=request.getParameter("id")%></td>
			</tr>
		</table>
	</center>
</body>
</html>