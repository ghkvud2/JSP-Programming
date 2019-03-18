<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!--버퍼에 HTML 내용이 저장되긴 하지만 response객체 때문에 <h2>는 나오지 않는다.  -->
	<h2>로그인 처리 페이지</h2>
	<%
		request.setCharacterEncoding("EUC-KR");
		//임의의 사용자 아이디/비밀번호
		String dbid = "aaaa";
		String dbpass = "1234";

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		//아이디와 패스워드가 일치하면 메인페이지로 이동시킨다.
		if (dbid.equals(id) && dbpass.equals(pass)) {
			response.sendRedirect("ResponseMain.jsp?id=" + id);
		} else {
	%>
		<script type="text/javascript">
			alert("아이디와 패스워드가 일치하지 않습니다.");
			history.go(-1);
		</script>
	<%
		}
	%>

</body>
</html>