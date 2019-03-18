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
		<h2>회원 정보 보기</h2>
		<%
			//POST 방식으로 데이터가 넘어올 때 한글이 깨질 수 있어서
			request.setCharacterEncoding("EUC-KR");

			String id = request.getParameter("id");
			String pass1 = request.getParameter("pass1");
			String pass2 = request.getParameter("pass2");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String[] hobbys = request.getParameterValues("hobby");
			String job = request.getParameter("job");
			String age = request.getParameter("age");
			String info = request.getParameter("info");

			if (!pass1.equals(pass2)) {
		%>
		<script type="text/javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
		<%
			}
		%>

		<table width="500" border="1">
			<tr height="50">
				<td width="150" align="center">아이디</td>
				<td width="350"><%=id%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">패스워드</td>
				<td width="350"><%=pass1%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">이메일 주소</td>
				<td width="350"><%=email%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">전화번호</td>
				<td width="350"><%=tel%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 관심분야</td>
				<td width="350">
				<%for(int i = 0 ; i < hobbys.length; i++){
					out.write(hobbys[i] +" ");
				} %>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">직업</td>
				<td width="350"><%=job%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">연령</td>
				<td width="350"><%=age%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">하고싶은 말</td>
				<td width="350"><%=info%></td>
			</tr>
		</table>
	</center>

</body>
</html>