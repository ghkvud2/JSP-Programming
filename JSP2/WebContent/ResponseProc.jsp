<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>이 페이지는 로그인 정보가 넘어오는 페이지입니다.</h2>

	<%
		//request.setCharacterEncoding("EUC-KR");
		//String id = request.getParameter("id");
		//String pass = request.getParameter("pass");
		//response.sendRedirect("ResponseRedirect.jsp?id=" + id + "&pass=" + pass);
	%>
	<jsp:forward page="ResponseRedirect.jsp">
		<jsp:param value="mmmm" name="id" />
	</jsp:forward>

	<h3>정보가 넘어갔을까요?</h3>

</body>
</html>